/*
 * Integration tests for the model compositor with the trie model.
 */

var assert = require('chai').assert;
var TrieModel = require('../../build/intermediate').models.TrieModel;
var ModelCompositor = require('../../build/intermediate').ModelCompositor;

describe('ModelCompositor', function() {
  it('should compose suggestions from a fat-fingered keypress', function () {
    var model = new TrieModel(
      jsonFixture('tries/english-1000')
    );
    var composite = new ModelCompositor(model);
    // Pretend to fat finger "the" as "thr"
    var the = { sample: { insert: 'r', deleteLeft: 0}, p: 0.45 };
    var thr = { sample: { insert: 'e', deleteLeft: 0}, p: 0.55 };
    var suggestions = composite.predict([thr, the], {
      left: 'Th', startOfBuffer: false, endOfBuffer: true,
    });

    // Get the top suggest for 'the' and 'thr*'.
    var theSuggestion = suggestions.filter(function (s) { return s.displayAs === 'the'; })[0];
    var thrSuggestion = suggestions.filter(function (s) { return s.displayAs.startsWith('thr'); })[0];

    // Sanity check: do we have actual real-valued probabilities?
    assert.isAbove(thrSuggestion.p, 0.0);
    assert.isBelow(thrSuggestion.p, 1.0);
    assert.isAbove(theSuggestion.p, 0.0);
    assert.isBelow(theSuggestion.p, 1.0);
    // 'the' should be the intended the result here.
    assert.isAbove(theSuggestion.p, thrSuggestion.p);
  });
});
