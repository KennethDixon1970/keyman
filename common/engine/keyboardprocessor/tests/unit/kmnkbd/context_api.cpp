/*
  Copyright:    © 2018 SIL International.
  Description:  Tests for the context API family of functions.
  Create Date:  19 Oct 2018
  Authors:      Tim Eves (TSE)
  History:      19 Oct 2018 - TSE - Initial implementation.
                22 Oct 2018 - TSE - Refactor to add and use try_status macro
                                    for improved readability.
                                  - Add more tests to cover corner cases and
                                    mutation functions.
*/
#include <string>

#include <keyboardprocessor.h>

#include "context.hpp"
#include "utfcodec.hpp"

namespace
{
  inline
  size_t count_codepoints(std::u16string const &s) {
    size_t n = 0;
    for (utf16::const_iterator i = s.c_str(); *i; ++i) ++n;
    return n;
  }

  std::u16string const  initial_bmp_context = u"Hello, အရှောက်, मानव अधिकारों की सार्वभौम घोषणा",
                        initial_smp_context = u"😀😁😂😃😄😅😆😇😈😉😊😋😌😍😎😏";
  auto const bmp_ctxt_size = count_codepoints(initial_bmp_context),
             smp_ctxt_size = count_codepoints(initial_smp_context);
  km_kbp_context_item test_marker_ctxt[2] = {
    {KM_KBP_CT_MARKER, {0,}, {0xDEADBEEF}},
    {KM_KBP_CT_END, {0,}, {0}}
  };


}

#define   try_status(expr) \
{auto __s = (expr); if (__s != KM_KBP_STATUS_OK) return 100*__LINE__+__s;}

int main(int, char * [])
{
  km_kbp_context_item *ctxt1, *ctxt2;
  // Test UTF16 to context_item conversion.
  try_status(km_kbp_context_items_from_utf16(initial_bmp_context.data(), &ctxt1));
  try_status(km_kbp_context_items_from_utf16(initial_smp_context.data(), &ctxt2));

  // Check context_item to UTF16 conversion, roundtrip test.
  km_kbp_cp ctxt_buffer[512] ={0,};
  // First call measure space 2nd call do conversion.
  auto n=km_kbp_context_items_to_utf16(ctxt1, nullptr, 0);
  if (n >= sizeof ctxt_buffer/sizeof(km_kbp_cp))  return __LINE__;
  n=km_kbp_context_items_to_utf16(ctxt1, ctxt_buffer,
                                  sizeof ctxt_buffer/sizeof(km_kbp_cp));
  if (initial_bmp_context != ctxt_buffer) return __LINE__;
  // Test roundtripping SMP characters in surrogate pairs.
  n=km_kbp_context_items_to_utf16(ctxt2, ctxt_buffer,
                                  sizeof ctxt_buffer/sizeof(km_kbp_cp));
  if (initial_smp_context != ctxt_buffer) return __LINE__;
  // Test buffer overrun protection.
  n=km_kbp_context_items_to_utf16(ctxt2, ctxt_buffer, smp_ctxt_size/3);
  if (n != smp_ctxt_size/3) return __LINE__;

  // Create a mock context object and set the items
  km_kbp_context mock_ctxt1, mock_ctxt2;
  try_status(km_kbp_context_set(&mock_ctxt1, ctxt1));
  try_status(km_kbp_context_set(&mock_ctxt2, ctxt2));

  // Delete the items lists
  km_kbp_context_items_dispose(ctxt1);
  km_kbp_context_items_dispose(ctxt2);

  // Test lengths, these are Unicode Scalar Values, not utf16 codeunits.
  if((n=km_kbp_context_length(&mock_ctxt1)) != bmp_ctxt_size) return __LINE__;
  if((n=km_kbp_context_length(&mock_ctxt2)) != smp_ctxt_size) return __LINE__;

  // retreive context and check it's okay.
  km_kbp_context_items_to_utf16(km_kbp_context_get(&mock_ctxt1),
                                ctxt_buffer,
                                sizeof ctxt_buffer/sizeof(km_kbp_cp));
  if (initial_bmp_context != ctxt_buffer) return __LINE__;
  km_kbp_context_items_to_utf16(km_kbp_context_get(&mock_ctxt2),
                                ctxt_buffer,
                                sizeof ctxt_buffer/sizeof(km_kbp_cp));
  if (initial_smp_context != ctxt_buffer) return __LINE__;

  // Call km_kbp_context_clear
  km_kbp_context_clear(&mock_ctxt2);
  if((n=km_kbp_context_length(&mock_ctxt2)) != 0) return __LINE__;

  // Mutation tests
  try_status(km_kbp_context_shrink(&mock_ctxt1, 42, nullptr));

  // Append a character, a marker and & a string.
  try_status(km_kbp_context_items_from_utf16(u" ", &ctxt1));
  try_status(km_kbp_context_items_from_utf16(u"World!", &ctxt2));
  try_status(km_kbp_context_append(&mock_ctxt1, ctxt1));
  try_status(km_kbp_context_append(&mock_ctxt1, test_marker_ctxt));
  try_status(km_kbp_context_append(&mock_ctxt1, ctxt2));

  // Delete the items lists
  km_kbp_context_items_dispose(ctxt1);
  km_kbp_context_items_dispose(ctxt2);

  // Check it matches. The marker will be elided during the conversion.
  km_kbp_context_items_to_utf16(km_kbp_context_get(&mock_ctxt1),
                                ctxt_buffer,
                                sizeof ctxt_buffer/sizeof(km_kbp_cp));
  if (std::u16string(u"Hello World!") != ctxt_buffer) return __LINE__;

  // Test shrink and prepend, delete more than we provide to prepend.
  try_status(km_kbp_context_items_from_utf16(u"Bye, ", &ctxt1));
  // We delete 7 characters plus 1 marker hence 8 and not 7 as expected if you
  //  go bye the test string above.
  try_status(km_kbp_context_shrink(&mock_ctxt1, 8, ctxt1));
  km_kbp_context_items_to_utf16(km_kbp_context_get(&mock_ctxt1),
                                ctxt_buffer,
                                sizeof ctxt_buffer/sizeof(km_kbp_cp));
  if (std::u16string(u"Bye, Hello") != ctxt_buffer) return __LINE__;

  return 0;
}