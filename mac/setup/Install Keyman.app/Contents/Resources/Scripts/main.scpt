FasdUAS 1.101.10   ��   ��    k             l     ��  ��     
 main.scpt     � 	 	    m a i n . s c p t   
  
 l     ��  ��      Install Keyman     �      I n s t a l l   K e y m a n      l     ��������  ��  ��        l     ��  ��    = 7 Copyright 2020 SIL International. All rights reserved.     �   n   C o p y r i g h t   2 0 2 0   S I L   I n t e r n a t i o n a l .   A l l   r i g h t s   r e s e r v e d .      l     ��������  ��  ��        l     ��  ��    P J This script automates the installation of Keyman on macOS. It is intended     �   �   T h i s   s c r i p t   a u t o m a t e s   t h e   i n s t a l l a t i o n   o f   K e y m a n   o n   m a c O S .   I t   i s   i n t e n d e d      l     ��   ��    J D as a stop-gap for a full-featured installer which provides clearer       � ! ! �   a s   a   s t o p - g a p   f o r   a   f u l l - f e a t u r e d   i n s t a l l e r   w h i c h   p r o v i d e s   c l e a r e r     " # " l     �� $ %��   $ $  instructions to the end user.    % � & & <   i n s t r u c t i o n s   t o   t h e   e n d   u s e r . #  ' ( ' l     �� ) *��   ) P J The script application expects a notarized Keyman.app to be placed inside    * � + + �   T h e   s c r i p t   a p p l i c a t i o n   e x p e c t s   a   n o t a r i z e d   K e y m a n . a p p   t o   b e   p l a c e d   i n s i d e (  , - , l     �� . /��   . 7 1 its folder in order for installation to succeed.    / � 0 0 b   i t s   f o l d e r   i n   o r d e r   f o r   i n s t a l l a t i o n   t o   s u c c e e d . -  1 2 1 l     ��������  ��  ��   2  3 4 3 l     5���� 5 r      6 7 6 J      8 8  9�� 9 m      : : � ; ;  s y s l o g��   7 o      ���� 0 dlog_targets DLOG_TARGETS��  ��   4  < = < l     ��������  ��  ��   =  > ? > h     �� @�� 0 installkeyman installKeyman @ k       A A  B C B l     ��������  ��  ��   C  D E D l     ��������  ��  ��   E  F G F l     �� H I��   H   Display welcome dialog    I � J J .   D i s p l a y   w e l c o m e   d i a l o g G  K L K l     ��������  ��  ��   L  M N M l     ��������  ��  ��   N  O P O l     Q���� Q I     �� R���� 0 dlog   R  S�� S m     T T � U U B # # #   S t a r t i n g   K e y m a n   i n s t a l l e r   # # #��  ��  ��  ��   P  V W V l   G X���� X Q    G Y Z [ Y k   
   \ \  ] ^ ] l  
 
�� _ `��   _   dialog    ` � a a    d i a l o g ^  b c b r   
  d e d I  
 �� f g
�� .sysodlogaskr        TEXT f l 	 
  h���� h m   
  i i � j j T h i s   a p p   w i l l   h e l p   y o u   i n s t a l l   K e y m a n   o n   y o u r   M a c . 
 
 W h e n   p r o m p t e d ,   a l l o w   a c c e s s   t o   S y s t e m   P r e f e r e n c e s   i n   o r d e r   t o   c o m p l e t e   t h e   i n s t a l l a t i o n .��  ��   g �� k l
�� 
btns k l 
   m���� m J     n n  o p o m     q q � r r  I n s t a l l p  s�� s m     t t � u u  E x i t��  ��  ��   l �� v w
�� 
dflt v l 	   x���� x m     y y � z z  I n s t a l l��  ��   w �� { |
�� 
cbtn { l 	   }���� } m     ~ ~ �    E x i t��  ��   | �� � �
�� 
appr � l 	   ����� � l 	   ����� � m     � � � � � 0 I n s t a l l   K e y m a n   f o r   m a c O S��  ��  ��  ��   � �� ���
�� 
disp � l 	   ����� � m     � � � � �  a p p l e t . i c n s��  ��  ��   e o      ���� 0 dialogreply dialogReply c  ��� � l   ��������  ��  ��  ��   Z R      �� � �
�� .ascrerr ****      � **** � o      ���� 0 errtext errText � �� ���
�� 
errn � o      ���� 0 errnum errNum��   [ Z   ( G � ����� � l  ( - ����� � =  ( - � � � o   ( )���� 0 errnum errNum � m   ) ,��������  ��   � k   0 C � �  � � � l  0 0�� � ���   �   User cancelled.    � � � �     U s e r   c a n c e l l e d . �  � � � I   0 8�� ����� 0 dlog   �  ��� � m   1 4 � � � � � @ U s e r   c a n c e l l e d   a t   W e l c o m e   d i a l o g��  ��   �  ��� � O  9 C � � � I  = B������
�� .aevtquitnull��� ��� null��  ��   �  f   9 :��  ��  ��  ��  ��   W  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � Q K Tell application "Keyman" to quit (if running, for upgrade; ignore result)    � � � � �   T e l l   a p p l i c a t i o n   " K e y m a n "   t o   q u i t   ( i f   r u n n i n g ,   f o r   u p g r a d e ;   i g n o r e   r e s u l t ) �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l  H P ����� � I   H P�� ����� 0 dlog   �  ��� � m   I L � � � � � d # # #   S h u t t i n g   d o w n   e x i s t i n g   i n s t a n c e s   o f   K e y m a n   # # #��  ��  ��  ��   �  � � � l  Q Z ����� � r   Q Z � � � I  Q X�� ���
�� .sysoexecTEXT���     TEXT � m   Q T � � � � � ( p k i l l   K e y m a n   | |   t r u e��   � o      ���� 0 scriptresult scriptResult��  ��   �  � � � l  [ a ����� � I   [ a�� ����� 0 dlog   �  ��� � o   \ ]���� 0 scriptresult scriptResult��  ��  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     � � ��   � 3 - Remove old version of Keyman (ignore result)    � � � � Z   R e m o v e   o l d   v e r s i o n   o f   K e y m a n   ( i g n o r e   r e s u l t ) �  � � � l     �~�}�|�~  �}  �|   �  � � � l     �{�z�y�{  �z  �y   �  � � � l  b j ��x�w � I   b j�v ��u�v 0 dlog   �  ��t � m   c f � � � � � L # # #   R e m o v i n g   o l d   v e r s i o n   o f   K e y m a n   # # #�t  �u  �x  �w   �  � � � l  k t ��s�r � r   k t � � � I  k r�q ��p
�q .sysoexecTEXT���     TEXT � m   k n � � � � � f r m   - v r f   ~ / L i b r a r y / I n p u t \   M e t h o d s / K e y m a n . a p p   | |   t r u e�p   � o      �o�o 0 scriptresult scriptResult�s  �r   �  � � � l  u { ��n�m � I   u {�l ��k�l 0 dlog   �  ��j � o   v w�i�i 0 scriptresult scriptResult�j  �k  �n  �m   �  � � � l     �h�g�f�h  �g  �f   �  � � � l     �e�d�c�e  �d  �c   �  � � � l     �b � ��b   � ( " Install Keyman (copy app folder)	    � � � � D   I n s t a l l   K e y m a n   ( c o p y   a p p   f o l d e r ) 	 �  � � � l     �a�`�_�a  �`  �_   �  � � � l     �^�]�\�^  �]  �\   �  � � � l  | � ��[�Z � r   | � � � � c   | � � � � n   | � � � � 1   � ��Y
�Y 
strq � n   | � � � � 1   � ��X
�X 
psxp � l  | � ��W�V � I  | ��U ��T
�U .earsffdralis        afdr � m   | �S
�S misccura�T  �W  �V   � m   � ��R
�R 
TEXT � o      �Q�Q "0 scriptcontainer scriptContainer�[  �Z   �  � � � l  � � �P�O  I   � ��N�M�N 0 dlog   �L b   � � b   � � m   � � � 8 # # #   C o p y i n g   n e w   K e y m a n   f r o m   o   � ��K�K "0 scriptcontainer scriptContainer m   � �		 �

 T K e y m a n . a p p   t o   ~ / L i b r a r y / I n p u t \   M e t h o d s   # # #�L  �M  �P  �O   �  l  � ��J�I r   � � b   � � b   � � m   � � �  c p   - v R   o   � ��H�H "0 scriptcontainer scriptContainer m   � � � f C o n t e n t s / M a c O S / K e y m a n . a p p   ~ / L i b r a r y / I n p u t \   M e t h o d s / o      �G�G 0 cmd  �J  �I    l  � ��F�E r   � � I  � ��D�C
�D .sysoexecTEXT���     TEXT o   � ��B�B 0 cmd  �C   o      �A�A 0 scriptresult scriptResult�F  �E    l  � � �@�?  I   � ��>!�=�> 0 dlog  ! "�<" o   � ��;�; 0 scriptresult scriptResult�<  �=  �@  �?   #$# l     �:�9�8�:  �9  �8  $ %&% l     �7�6�5�7  �6  �5  & '(' l     �4)*�4  ) + % remove quarantine extended attribute   * �++ J   r e m o v e   q u a r a n t i n e   e x t e n d e d   a t t r i b u t e( ,-, l     �3�2�1�3  �2  �1  - ./. l     �0�/�.�0  �/  �.  / 010 l  � �2�-�,2 I   � ��+3�*�+ 0 dlog  3 4�)4 m   � �55 �66 z # # #   R e m o v i n g   q u a r a n t i n e   a t t r i b u t e   o n   i n s t a l l e d   K e y m a n . a p p   # # #�)  �*  �-  �,  1 787 l  � �9�(�'9 r   � �:;: I  � ��&<�%
�& .sysoexecTEXT���     TEXT< m   � �== �>> � x a t t r   - d   - r   c o m . a p p l e . q u a r a n t i n e   ~ / L i b r a r y / I n p u t \   M e t h o d s / K e y m a n . a p p�%  ; o      �$�$ 0 scriptresult scriptResult�(  �'  8 ?@? l  � �A�#�"A I   � ��!B� �! 0 dlog  B C�C o   � ��� 0 scriptresult scriptResult�  �   �#  �"  @ DED l     ����  �  �  E FGF l     ����  �  �  G HIH l     �JK�  J 2 , Enable Keyman in Privacy / Input Monitoring   K �LL X   E n a b l e   K e y m a n   i n   P r i v a c y   /   I n p u t   M o n i t o r i n gI MNM l     ����  �  �  N OPO l     ����  �  �  P QRQ l  � �S��S I   � ��T�� 0 dlog  T U�U m   � �VV �WW l # # #   H e l p i n g   u s e r   e n a b l e   K e y m a n   i n   I n p u t   M o n i t o r i n g   # # #�  �  �  �  R XYX l     ��
�	�  �
  �	  Y Z[Z l  �V\��\ Q   �V]^_] O   �`a` k   �bb cdc r   � �efe 5   � ��g�
� 
xppbg m   � �hh �ii : c o m . a p p l e . p r e f e r e n c e . s e c u r i t y
� kfrmID  f l     j��j 1   � ��
� 
xpcp�  �  d klk I  ��m� 
� .miscmvisnull���     ****m n   �non 4  ��p
�� 
xppap m  qq �rr  P r i v a c yo 5   ���s��
�� 
xppbs m   �tt �uu : c o m . a p p l e . p r e f e r e n c e . s e c u r i t y
�� kfrmID  �   l v��v I ������
�� .miscactvnull��� ��� null��  ��  ��  a m   � �ww�                                                                                  sprf  alis    `  Macintosh HD                   BD ����System Preferences.app                                         ����            ����  
 cu             Applications  -/:System:Applications:System Preferences.app/   .  S y s t e m   P r e f e r e n c e s . a p p    M a c i n t o s h   H D  *System/Applications/System Preferences.app  / ��  ^ R      ��xy
�� .ascrerr ****      � ****x o      ���� 0 errtext errTexty ��z��
�� 
errnz o      ���� 0 errnum errNum��  _ k  V{{ |}| I  3��~���� 0 dlog  ~ �� b   /��� b   +��� b   )��� b   %��� m   #�� ���  A n   e r r o r  � o  #$���� 0 errtext errText� m  %(�� ���    (� o  )*���� 0 errnum errNum� m  +.�� ��� X )   o c c u r r e d   t r y i n g   t o   o p e n   S y s t e m   P r e f e r e n c e s��  ��  } ���� Z  4V������ l 49������ = 49��� o  45���� 0 errnum errNum� m  58�����1��  ��  � k  <D�� ��� l <<������  � I C User did not give permission to app, let's show the dialog anyway.   � ��� �   U s e r   d i d   n o t   g i v e   p e r m i s s i o n   t o   a p p ,   l e t ' s   s h o w   t h e   d i a l o g   a n y w a y .� ���� I  <D������� 0 dlog  � ���� m  =@�� ��� , A t t e m p t i n g   t o   c o n t i n u e��  ��  ��  ��  � I GV�����
�� .sysodlogaskr        TEXT� b  GR��� b  GP��� b  GL��� m  GJ�� ��� j A n   e r r o r   o c c u r r e d   t r y i n g   t o   o p e n   S y s t e m   P r e f e r e n c e s :  � o  JK���� 0 errnum errNum� o  LO��
�� 
ret � o  PQ���� 0 errtext errText��  ��  �  �  [ ��� l     ��������  ��  ��  � ��� l Wa������ O Wa��� I [`������
�� .miscactvnull��� ��� null��  ��  �  f  WX��  ��  � ��� l     ��������  ��  ��  � ��� l b������� Q  b����� r  e���� I e�����
�� .sysodlogaskr        TEXT� b  ex��� b  et��� b  ep��� b  el��� l 	eh������ m  eh�� ��� � I n   t h e   P r i v a c y   p a n e   o f   S e c u r i t y   &   P r i v a c y   i n   S y s t e m   P r e f e r e n c e s ,   s e l e c t   ' I n p u t   M o n i t o r i n g ' ,  ��  ��  � l 	hk������ m  hk�� ��� � t h e n   c l i c k   t h e   l o c k   t o   m a k e   c h a n g e s ,   a n d   m a k e   s u r e   K e y m a n   i n   t h e   l i s t   i s   c h e c k e d .��  ��  � o  lo��
�� 
ret � o  ps��
�� 
ret � l 	tw������ m  tw�� ��� d O n c e   K e y m a n   i s   c h e c k e d ,   c l i c k   O K   h e r e   t o   c o n t i n u e .��  ��  � ����
�� 
btns� l 
y������� J  y��� ��� m  y|�� ���  O K� ���� m  |�� ���  E x i t��  ��  ��  � ����
�� 
dflt� l 	�������� m  ���� ���  O K��  ��  � ����
�� 
cbtn� l 	�������� m  ���� ���  E x i t��  ��  � ����
�� 
appr� l 	�������� l 	�������� l 	�������� m  ���� ��� 0 I n s t a l l   K e y m a n   f o r   m a c O S��  ��  ��  ��  ��  ��  � �����
�� 
disp� l 	�������� m  ���� ���  a p p l e t . i c n s��  ��  ��  � o      ���� 0 dialogreply dialogReply� R      ����
�� .ascrerr ****      � ****� o      ���� 0 errtext errText� �����
�� 
errn� o      ���� 0 errnum errNum��  � Z  ��������� l �������� = ����� o  ������ 0 errnum errNum� m  ����������  ��  � k  ���� ��� l ��������  �   User cancelled.   � ���     U s e r   c a n c e l l e d .� ��� I  ��������� 0 dlog  � ���� m  ���� �   D U s e r   c a n c e l l e d   a t   I n p u t   M o n i t o r i n g��  ��  � �� O �� I ��������
�� .aevtquitnull��� ��� null��  ��    f  ����  ��  ��  ��  ��  �  l     ��������  ��  ��    l     ��������  ��  ��   	 l     ��
��  
 A ; open the Input Methods System Preference and enable Keyman    � v   o p e n   t h e   I n p u t   M e t h o d s   S y s t e m   P r e f e r e n c e   a n d   e n a b l e   K e y m a n	  l     ��������  ��  ��    l     ��������  ��  ��    l ������ I  �������� 0 dlog   �� m  �� � ` # # #   H e l p i n g   u s e r   a d d   K e y m a n   t o   I n p u t   M e t h o d s   # # #��  ��  ��  ��    l ������ r  �� b  �� o  ������ "0 scriptcontainer scriptContainer m  �� �   P C o n t e n t s / M a c O S / t e x t i n p u t s o u r c e   - e   K e y m a n o      ���� 0 cmd  ��  ��   !"! l ��#����# r  ��$%$ I ����&��
�� .sysoexecTEXT���     TEXT& o  ������ 0 cmd  ��  % o      ���� 0 scriptresult scriptResult��  ��  " '(' l ��)����) I  ����*���� 0 dlog  * +�+ o  ���~�~ 0 scriptresult scriptResult�  ��  ��  ��  ( ,-, l     �}�|�{�}  �|  �{  - ./. l     �z01�z  0 E ? TODO: check the output result and if Keyman is not found, then   1 �22 ~   T O D O :   c h e c k   t h e   o u t p u t   r e s u l t   a n d   i f   K e y m a n   i s   n o t   f o u n d ,   t h e n/ 343 l     �y56�y  5 %  we go to troubleshooting mode?   6 �77 >   w e   g o   t o   t r o u b l e s h o o t i n g   m o d e ?4 898 l     �x�w�v�x  �w  �v  9 :;: l      �u<=�u  <��		tell application "System Preferences"		set the current pane to pane id "com.apple.preference.keyboard"		# set r to get the name of every anchor of pane id "com.apple.preference.keyboard"		reveal anchor "InputSources" of pane id "com.apple.preference.keyboard"		activate	end tell		tell me to activate		try		set dialogReply to display dialog �			"In the Input Sources pane of Keyboard Preferences, click + " & �			"to add Keyman, which will be under 'Multiple Languages' in the " & �			�				"list presented to you.

Once you have added Keyman, click OK here to continue." buttons {"OK", "Exit"} �			default button �			"OK" cancel button �			"Exit" with title �			�				�					"Install Keyman for macOS" with icon �			"applet.icns"	on error errText number errNum		if (errNum is equal to -128) then			-- User cancelled.
			dlog("User cancelled at Input Sources")			tell me to quit		end if	end try	   = �>>4 	  	 t e l l   a p p l i c a t i o n   " S y s t e m   P r e f e r e n c e s "  	 	 s e t   t h e   c u r r e n t   p a n e   t o   p a n e   i d   " c o m . a p p l e . p r e f e r e n c e . k e y b o a r d "  	 	 #   s e t   r   t o   g e t   t h e   n a m e   o f   e v e r y   a n c h o r   o f   p a n e   i d   " c o m . a p p l e . p r e f e r e n c e . k e y b o a r d "  	 	 r e v e a l   a n c h o r   " I n p u t S o u r c e s "   o f   p a n e   i d   " c o m . a p p l e . p r e f e r e n c e . k e y b o a r d "  	 	 a c t i v a t e  	 e n d   t e l l  	  	 t e l l   m e   t o   a c t i v a t e  	  	 t r y  	 	 s e t   d i a l o g R e p l y   t o   d i s p l a y   d i a l o g   �  	 	 	 " I n   t h e   I n p u t   S o u r c e s   p a n e   o f   K e y b o a r d   P r e f e r e n c e s ,   c l i c k   +   "   &   �  	 	 	 " t o   a d d   K e y m a n ,   w h i c h   w i l l   b e   u n d e r   ' M u l t i p l e   L a n g u a g e s '   i n   t h e   "   &   �  	 	 	 �  	 	 	 	 " l i s t   p r e s e n t e d   t o   y o u . 
 
 O n c e   y o u   h a v e   a d d e d   K e y m a n ,   c l i c k   O K   h e r e   t o   c o n t i n u e . "   b u t t o n s   { " O K " ,   " E x i t " }   �  	 	 	 d e f a u l t   b u t t o n   �  	 	 	 " O K "   c a n c e l   b u t t o n   �  	 	 	 " E x i t "   w i t h   t i t l e   �  	 	 	 �  	 	 	 	 �  	 	 	 	 	 " I n s t a l l   K e y m a n   f o r   m a c O S "   w i t h   i c o n   �  	 	 	 " a p p l e t . i c n s "  	 o n   e r r o r   e r r T e x t   n u m b e r   e r r N u m  	 	 i f   ( e r r N u m   i s   e q u a l   t o   - 1 2 8 )   t h e n  	 	 	 - -   U s e r   c a n c e l l e d . 
 	 	 	 d l o g ( " U s e r   c a n c e l l e d   a t   I n p u t   S o u r c e s " )  	 	 	 t e l l   m e   t o   q u i t  	 	 e n d   i f  	 e n d   t r y  	; ?@? l     �t�s�r�t  �s  �r  @ ABA l     �q�p�o�q  �p  �o  B CDC l     �nEF�n  E  	 Success!   F �GG    S u c c e s s !D HIH l     �m�l�k�m  �l  �k  I JKJ l     �j�i�h�j  �i  �h  K LML l ��N�g�fN I ���eOP
�e .sysodlogaskr        TEXTO b  ��QRQ b  ��STS m  ��UU �VV � K e y m a n   h a s   b e e n   s u c c e s s f u l l y   i n s t a l l e d ! 
 
 Y o u   c a n   n o w   s e l e c t   K e y m a n   i n   t h e  T l 	��W�d�cW m  ��XX �YY � I n p u t   M e t h o d s   m e n u   i n   t h e   m e n u   b a r .   O n c e   y o u   h a v e   s e l e c t e d   K e y m a n ,   o p e n   t h e  �d  �c  R l 	��Z�b�aZ l 	��[�`�_[ m  ��\\ �]] � I n p u t   M e t h o d s   m e n u   o n c e   m o r e   a n d   s e l e c t   K e y m a n   C o n f i g u r a t i o n   t o   a d d   y o u r   f i r s t   k e y b o a r d .�`  �_  �b  �a  P �^^_
�^ 
btns^ J  ��`` a�]a m  ��bb �cc  O K�]  _ �\d�[
�\ 
dispd m  ��ee �ff  a p p l e t . i c n s�[  �g  �f  M ghg l     �Z�Y�X�Z  �Y  �X  h iji l �k�W�Vk I  ��Ul�T�U 0 dlog  l m�Sm m  ��nn �oo > # # #   S u c c e s s f u l   i n s t a l l a t i o n   # # #�S  �T  �W  �V  j pqp l     �R�Q�P�R  �Q  �P  q rsr l t�O�Nt O uvu I �M�L�K
�M .aevtquitnull��� ��� null�L  �K  v  f  �O  �N  s w�Jw l     �Ixy�I  x   display alert r   y �zz     d i s p l a y   a l e r t   r�J   ? {|{ l     �H�G�F�H  �G  �F  | }~} l   �E�D I   �C��B
�C .aevtoappnull  �   � ****� o    �A�A 0 installkeyman installKeyman�B  �E  �D  ~ ��� l     �@�?�>�@  �?  �>  � ��� l     �=���=  � 9 3 From: https://stackoverflow.com/a/21341372/1836776   � ��� f   F r o m :   h t t p s : / / s t a c k o v e r f l o w . c o m / a / 2 1 3 4 1 3 7 2 / 1 8 3 6 7 7 6� ��� l     �<���<  � x r Logs a text representation of the specified object or objects, which may be of any type, typically for debugging.   � ��� �   L o g s   a   t e x t   r e p r e s e n t a t i o n   o f   t h e   s p e c i f i e d   o b j e c t   o r   o b j e c t s ,   w h i c h   m a y   b e   o f   a n y   t y p e ,   t y p i c a l l y   f o r   d e b u g g i n g .� ��� l     �;���;  � J D Works hard to find a meaningful text representation of each object.   � ��� �   W o r k s   h a r d   t o   f i n d   a   m e a n i n g f u l   t e x t   r e p r e s e n t a t i o n   o f   e a c h   o b j e c t .� ��� l     �:���:  �  	 SYNOPSIS   � ���    S Y N O P S I S� ��� l     �9���9  � $    dlog(anyObjOrListOfObjects)   � ��� <       d l o g ( a n y O b j O r L i s t O f O b j e c t s )� ��� l     �8���8  �   USE EXAMPLES   � ���    U S E   E X A M P L E S� ��� l     �7���7  � ( "   dlog("before")  # single object   � ��� D       d l o g ( " b e f o r e " )     #   s i n g l e   o b j e c t� ��� l     �6���6  � E ?     dlog({ "front window: ", front window }) # list of objects   � ��� ~           d l o g ( {   " f r o n t   w i n d o w :   " ,   f r o n t   w i n d o w   } )   #   l i s t   o f   o b j e c t s� ��� l     �5���5  �   SETUP   � ���    S E T U P� ��� l     �4���4  � � �   At the top of your script, define global variable DLOG_TARGETS and set it to a *list* of targets (even if you only have 1 target).   � ���
       A t   t h e   t o p   o f   y o u r   s c r i p t ,   d e f i n e   g l o b a l   v a r i a b l e   D L O G _ T A R G E T S   a n d   s e t   i t   t o   a   * l i s t *   o f   t a r g e t s   ( e v e n   i f   y o u   o n l y   h a v e   1   t a r g e t ) .� ��� l     �3���3  � u o     set DLOG_TARGETS to {} # must be a list with any combination of: "log", "syslog", "alert", <posixFilePath>   � ��� �           s e t   D L O G _ T A R G E T S   t o   { }   #   m u s t   b e   a   l i s t   w i t h   a n y   c o m b i n a t i o n   o f :   " l o g " ,   " s y s l o g " ,   " a l e r t " ,   < p o s i x F i l e P a t h >� ��� l     �2���2  � A ;   An *empty* list means that logging should be *disabled*.   � ��� v       A n   * e m p t y *   l i s t   m e a n s   t h a t   l o g g i n g   s h o u l d   b e   * d i s a b l e d * .� ��� l     �1���1  � j d   If you specify a POSIX file path, the file will be *appended* to; variable references in the path   � ��� �       I f   y o u   s p e c i f y   a   P O S I X   f i l e   p a t h ,   t h e   f i l e   w i l l   b e   * a p p e n d e d *   t o ;   v a r i a b l e   r e f e r e n c e s   i n   t h e   p a t h� ��� l     �0���0  � ^ X   are allowed, and as a courtesy the path may start with "~" to refer to your home dir.   � ��� �       a r e   a l l o w e d ,   a n d   a s   a   c o u r t e s y   t h e   p a t h   m a y   s t a r t   w i t h   " ~ "   t o   r e f e r   t o   y o u r   h o m e   d i r .� ��� l     �/���/  � ~ x   Caveat: while you can *remove* the variable definition to disable logging, you'll take an additional performance hit.   � ��� �       C a v e a t :   w h i l e   y o u   c a n   * r e m o v e *   t h e   v a r i a b l e   d e f i n i t i o n   t o   d i s a b l e   l o g g i n g ,   y o u ' l l   t a k e   a n   a d d i t i o n a l   p e r f o r m a n c e   h i t .� ��� l     �.���.  �   SETUP EXAMPLES   � ���    S E T U P   E X A M P L E S� ��� l     �-���-  � ] W    For instance, to use both AppleScript's log command *and* display a GUI alert, use:   � ��� �         F o r   i n s t a n c e ,   t o   u s e   b o t h   A p p l e S c r i p t ' s   l o g   c o m m a n d   * a n d *   d i s p l a y   a   G U I   a l e r t ,   u s e :� ��� l     �,���,  � 3 -       set DLOG_TARGETS to { "log", "alert" }   � ��� Z               s e t   D L O G _ T A R G E T S   t o   {   " l o g " ,   " a l e r t "   }� ��� l     �+���+  �   Note:    � ���    N o t e :  � ��� l     �*���*  � Y S   - Since the subroutine is still called even when DLOG_TARGETS is an empty list,    � ��� �       -   S i n c e   t h e   s u b r o u t i n e   i s   s t i l l   c a l l e d   e v e n   w h e n   D L O G _ T A R G E T S   i s   a n   e m p t y   l i s t ,  � ��� l     �)���)  � O I     you pay a performancy penalty for leaving dlog() calls in your code.   � ��� �           y o u   p a y   a   p e r f o r m a n c y   p e n a l t y   f o r   l e a v i n g   d l o g ( )   c a l l s   i n   y o u r   c o d e .� ��� l     �(���(  � ` Z   - Unlike with the built-in log() method, you MUST use parentheses around the parameter.   � ��� �       -   U n l i k e   w i t h   t h e   b u i l t - i n   l o g ( )   m e t h o d ,   y o u   M U S T   u s e   p a r e n t h e s e s   a r o u n d   t h e   p a r a m e t e r .� ��� l     �'���'  � o i   - To specify more than one object, pass a *list*. Note that while you could try to synthesize a single   � ��� �       -   T o   s p e c i f y   m o r e   t h a n   o n e   o b j e c t ,   p a s s   a   * l i s t * .   N o t e   t h a t   w h i l e   y o u   c o u l d   t r y   t o   s y n t h e s i z e   a   s i n g l e� ��� l     �&���&  � q k     output string by concatenation yourself, you'd lose the benefit of this subroutine's ability to derive   � ��� �           o u t p u t   s t r i n g   b y   c o n c a t e n a t i o n   y o u r s e l f ,   y o u ' d   l o s e   t h e   b e n e f i t   o f   t h i s   s u b r o u t i n e ' s   a b i l i t y   t o   d e r i v e� ��� l     �%���%  � g a     readable text representations even of objects that can't simply be converted with `as text`.   � ��� �           r e a d a b l e   t e x t   r e p r e s e n t a t i o n s   e v e n   o f   o b j e c t s   t h a t   c a n ' t   s i m p l y   b e   c o n v e r t e d   w i t h   ` a s   t e x t ` .�  �$  i     I      �#�"�# 0 dlog   �! o      � �  .0 anyobjorlistofobjects anyObjOrListOfObjects�!  �"   k    �  p       ��� 0 dlog_targets DLOG_TARGETS�   	
	 Q      Z   �� =    n     1    �
� 
leng o    �� 0 dlog_targets DLOG_TARGETS m    ��   L    ��  �  �   R      ���
� .ascrerr ****      � ****�  �   L    ��  
  l   ��   ] W The following tries hard to derive a readable representation from the input object(s).    � �   T h e   f o l l o w i n g   t r i e s   h a r d   t o   d e r i v e   a   r e a d a b l e   r e p r e s e n t a t i o n   f r o m   t h e   i n p u t   o b j e c t ( s ) .  Z   -�� >   ! n      m    �
� 
pcls  o    �� .0 anyobjorlistofobjects anyObjOrListOfObjects m     �
� 
list r   $ )!"! J   $ '## $�$ o   $ %�� .0 anyobjorlistofobjects anyObjOrListOfObjects�  " o      �� .0 anyobjorlistofobjects anyObjOrListOfObjects�  �   %&% q   . .'' �
(�
 0 lst  ( �	)�	 0 i  ) �*� 0 txt  * �+� 0 errmsg errMsg+ �,� 0 orgtids orgTids, �-� 0 oname oName- �.� 
0 oid oId. �/� 
0 prefix  / �0� 0 	logtarget 	logTarget0 �1� 0 txtcombined txtCombined1 � 2�  0 
prefixtime 
prefixTime2 ������  0 prefixdatetime prefixDateTime��  & 343 r   . 2565 J   . 0����  6 o      ���� 0 lst  4 787 X   3�9��:9 k   C�;; <=< r   C F>?> m   C D@@ �AA  ? o      ���� 0 txt  = BCB Y   G �D��EF��D k   Q �GG HIH Q   Q �JKLJ Z   T �MN��OM =  T WPQP o   T U���� 0 i  Q m   U V���� N Z   Z �RS��TR =  Z _UVU n   Z ]WXW m   [ ]��
�� 
pclsX o   Z [���� 0 anyobj anyObjV m   ] ^��
�� 
listS k   b �YY Z[Z l  b {\]^\ r   b {_`_ J   b jaa bcb n  b eded 1   c e��
�� 
txdle 1   b c��
�� 
ascrc f��f J   e hgg h��h m   e fii �jj  ,  ��  ��  ` J      kk lml o      ���� 0 orgtids orgTidsm n��n n     opo 1   w y��
�� 
txdlp 1   v w��
�� 
ascr��  ]   '   ^ �qq    '[ rsr r   | �tut b   | �vwv l  | �x����x c   | �yzy b   | {|{ m   | }}} �~~  {| o   } ~���� 0 anyobj anyObjz m    ���
�� 
TEXT��  ��  w m   � � ���  }u o      ���� 0 txt  s ���� l  � ����� r   � ���� o   � ����� 0 orgtids orgTids� n     ��� 1   � ���
�� 
txdl� 1   � ���
�� 
ascr�   '   � ���    '��  ��  T r   � ���� c   � ���� o   � ����� 0 anyobj anyObj� m   � ���
�� 
TEXT� o      ���� 0 txt  ��  O r   � ���� c   � ���� n   � ���� 1   � ���
�� 
pALL� o   � ����� 0 anyobj anyObj� m   � ���
�� 
TEXT� o      ���� 0 txt  K R      �����
�� .ascrerr ****      � ****� o      ���� 0 errmsg errMsg��  L k   � ��� ��� l  � �������  � 3 - Trick for records and record-*like* objects:   � ��� Z   T r i c k   f o r   r e c o r d s   a n d   r e c o r d - * l i k e *   o b j e c t s :� ��� l  � �������  � � � We exploit the fact that the error message contains the desired string representation of the record, so we extract it from there. This (still) works as of AS 2.3 (OS X 10.9).   � ���^   W e   e x p l o i t   t h e   f a c t   t h a t   t h e   e r r o r   m e s s a g e   c o n t a i n s   t h e   d e s i r e d   s t r i n g   r e p r e s e n t a t i o n   o f   t h e   r e c o r d ,   s o   w e   e x t r a c t   i t   f r o m   t h e r e .   T h i s   ( s t i l l )   w o r k s   a s   o f   A S   2 . 3   ( O S   X   1 0 . 9 ) .� ���� Q   � ������ r   � ���� I  � ������
�� .sysoexecTEXT���     TEXT� b   � ���� m   � ��� ��� , e g r e p   - o   ' \ { . * \ } '   < < <  � n   � ���� 1   � ���
�� 
strq� o   � ����� 0 errmsg errMsg��  � o      ���� 0 txt  � R      ������
�� .ascrerr ****      � ****��  ��  ��  ��  I ���� Z  � �������� >  � ���� o   � ����� 0 txt  � m   � ��� ���  �  S   � ���  ��  ��  �� 0 i  E m   J K���� F m   K L���� ��  C ��� r   � ���� m   � ��� ���  � o      ���� 
0 prefix  � ��� Z   ��������� F   ���� H   � ��� E  � ���� J   � ��� ��� m   � ���
�� 
ctxt� ��� m   � ���
�� 
long� ��� m   � ���
�� 
doub� ��� m   � ���
�� 
bool� ��� m   � ���
�� 
ldt � ��� m   � ���
�� 
list� ���� m   � ���
�� 
reco��  � n   � ���� m   � ���
�� 
pcls� o   � ����� 0 anyobj anyObj� >  � ��� o   � ����� 0 anyobj anyObj� m   � ���
�� 
msng� k  ��� ��� r  ��� b  ��� m  
�� ���  [� n  
��� m  ��
�� 
pcls� o  
���� 0 anyobj anyObj� o      ���� 
0 prefix  � ��� r  ��� m  �� ���  � o      ���� 0 oname oName� ��� r  ��� m  �� ���  � o      ���� 
0 oid oId� ��� Q  J����� k   A�� ��� r   '��� n   %��� 1  !%��
�� 
pnam� o   !���� 0 anyobj anyObj� o      ���� 0 oname oName� ���� Z (A������� > (-��� o  ()���� 0 oname oName� m  ),��
�� 
msng� r  0=��� b  0;��� b  07� � b  05 o  01���� 
0 prefix   m  14 �    n a m e = "  o  56���� 0 oname oName� m  7: �  "� o      ���� 
0 prefix  ��  ��  ��  � R      ������
�� .ascrerr ****      � ****��  ��  ��  �  Q  Kt	
��	 k  Nk  r  NU n  NS 1  OS��
�� 
ID   o  NO���� 0 anyobj anyObj o      ���� 
0 oid oId �� Z Vk���� > V[ o  VW���� 
0 oid oId m  WZ��
�� 
msng r  ^g b  ^e b  ^c o  ^_���� 
0 prefix   m  _b �    i d = o  cd���� 
0 oid oId o      ���� 
0 prefix  ��  ��  ��  
 R      ������
�� .ascrerr ****      � ****��  ��  ��     r  u|!"! b  uz#$# o  uv���� 
0 prefix  $ m  vy%% �&&  ]  " o      ���� 
0 prefix    '��' r  }�()( b  }�*+* o  }~���� 
0 prefix  + o  ~���� 0 txt  ) o      ���� 0 txt  ��  ��  ��  � ,��, r  ��-.- b  ��/0/ o  ������ 0 lst  0 o  ������ 0 txt  . o      ���� 0 lst  ��  �� 0 anyobj anyObj: o   6 7���� .0 anyobjorlistofobjects anyObjOrListOfObjects8 121 l ��3453 r  ��676 J  ��88 9:9 n ��;<; 1  ����
�� 
txdl< 1  ����
�� 
ascr: =��= J  ��>> ?��? m  ��@@ �AA   ��  ��  7 J      BB CDC o      ���� 0 orgtids orgTidsD E��E n     FGF 1  ����
�� 
txdlG 1  ���
� 
ascr��  4   '   5 �HH    '2 IJI r  ��KLK c  ��MNM o  ���~�~ 0 lst  N m  ���}
�} 
TEXTL o      �|�| 0 txtcombined txtCombinedJ OPO r  ��QRQ b  ��STS b  ��UVU m  ��WW �XX  [V n  ��YZY 1  ���{
�{ 
tstrZ l ��[�z�y[ I ���x�w�v
�x .misccurdldt    ��� null�w  �v  �z  �y  T m  ��\\ �]]  ]  R o      �u�u 0 
prefixtime 
prefixTimeP ^_^ r  ��`a` b  ��bcb b  ��ded b  ��fgf m  ��hh �ii  [g n  ��jkj 1  ���t
�t 
shdtk l ��l�s�rl I ���q�p�o
�q .misccurdldt    ��� null�p  �o  �s  �r  e m  ��mm �nn   c n  ��opo 7 ���nqr
�n 
ctxtq m  ���m�m r m  ���l�l��p o  ���k�k 0 
prefixtime 
prefixTimea o      �j�j  0 prefixdatetime prefixDateTime_ sts l ��uvwu r  ��xyx o  ���i�i 0 orgtids orgTidsy n     z{z 1  ���h
�h 
txdl{ 1  ���g
�g 
ascrv   '   w �||    't }~} l ���f��f   0 * Log the result to every target specified.   � ��� T   L o g   t h e   r e s u l t   t o   e v e r y   t a r g e t   s p e c i f i e d .~ ��e� X  ����d�� Z   ������ =  	��� n   ��� 1  �c
�c 
pcnt� o   �b�b 0 	logtarget 	logTarget� m  �� ���  l o g� I �a��`
�a .ascrcmnt****      � ****� b  ��� o  �_�_ 0 
prefixtime 
prefixTime� o  �^�^ 0 txtcombined txtCombined�`  � ��� = ��� n  ��� 1  �]
�] 
pcnt� o  �\�\ 0 	logtarget 	logTarget� m  �� ��� 
 a l e r t� ��� I ")�[��Z
�[ .sysodisAaleR        TEXT� b  "%��� o  "#�Y�Y 0 
prefixtime 
prefixTime� o  #$�X�X 0 txtcombined txtCombined�Z  � ��� = ,5��� n  ,1��� 1  -1�W
�W 
pcnt� o  ,-�V�V 0 	logtarget 	logTarget� m  14�� ���  s y s l o g� ��U� k  8[�� ��� l 88�T���T  � m g display alert "logger -t " & quoted form of ("AS: " & (name of me)) & " " & quoted form of txtCombined   � ��� �   d i s p l a y   a l e r t   " l o g g e r   - t   "   &   q u o t e d   f o r m   o f   ( " A S :   "   &   ( n a m e   o f   m e ) )   &   "   "   &   q u o t e d   f o r m   o f   t x t C o m b i n e d� ��� r  8Y��� I 8W�S��R
�S .sysoexecTEXT���     TEXT� b  8S��� b  8M��� b  8I��� m  8;�� ���  l o g g e r   - t  � n  ;H��� 1  DH�Q
�Q 
strq� l ;D��P�O� b  ;D��� m  ;>�� ���  A S :  � l >C��N�M� n  >C��� 1  ?C�L
�L 
pnam�  f  >?�N  �M  �P  �O  � m  IL�� ���   � n  MR��� 1  NR�K
�K 
strq� o  MN�J�J 0 txtcombined txtCombined�R  � o      �I�I 0 res  � ��H� l ZZ�G���G  �   display alert res   � ��� $   d i s p l a y   a l e r t   r e s�H  �U  � l ^����� k  ^��� ��� r  ^e��� n  ^c��� 1  _c�F
�F 
pcnt� o  ^_�E�E 0 	logtarget 	logTarget� o      �D�D 	0 fpath  � ��� Z f����C�B� C  fk��� o  fg�A�A 	0 fpath  � m  gj�� ���  ~ /� r  n���� b  n��� m  nq�� ���  $ H O M E /� n  q~��� 7 r~�@��
�@ 
ctxt� m  xz�?�? � m  {}�>�>��� o  qr�=�= 	0 fpath  � o      �<�< 	0 fpath  �C  �B  � ��;� I ���:��9
�: .sysoexecTEXT���     TEXT� b  ����� b  ����� b  ����� b  ����� m  ���� ���  p r i n t f   ' % s \ n '  � n  ����� 1  ���8
�8 
strq� l ����7�6� b  ����� o  ���5�5  0 prefixdatetime prefixDateTime� o  ���4�4 0 txtcombined txtCombined�7  �6  � m  ���� ��� 
   > >   "� o  ���3�3 	0 fpath  � m  ���� ���  "�9  �;  � 6 0 assumed to be a POSIX file path to *append* to.   � ��� `   a s s u m e d   t o   b e   a   P O S I X   f i l e   p a t h   t o   * a p p e n d *   t o .�d 0 	logtarget 	logTarget� o  ���2�2 0 dlog_targets DLOG_TARGETS�e  �$       �1� �1  � �0�/�.�0 0 installkeyman installKeyman�/ 0 dlog  
�. .aevtoappnull  �   � ****  �- @  �- 0 installkeyman installKeyman   �,
�, .aevtoappnull  �   � **** �+�*�)�(
�+ .aevtoappnull  �   � **** k    		  O

  V  �  �  �  �  �  �  �  �    0 7 ? Q Z � �   !   '!! L"" i## r�'�'  �*  �)   �&�%�$�#�"�!�& 0 dialogreply dialogReply�% 0 errtext errText�$ 0 errnum errNum�# 0 scriptresult scriptResult�" "0 scriptcontainer scriptContainer�! 0 cmd   J T�  i� q t� y� ~� �� ����$� �� � �� � ������	5=Vw�h��t�q��
����	�������������UX\be�n�  0 dlog  
� 
btns
� 
dflt
� 
cbtn
� 
appr
� 
disp� 

� .sysodlogaskr        TEXT� 0 errtext errText$ ���
� 
errn� 0 errnum errNum�  ���
� .aevtquitnull��� ��� null
� .sysoexecTEXT���     TEXT
� misccura
� .earsffdralis        afdr
� 
psxp
� 
strq
� 
TEXT
� 
xppb
� kfrmID  
� 
xpcp
� 
xppa
� .miscmvisnull���     ****
�
 .miscactvnull��� ��� null�	�1
� 
ret � �(*�k+ O ����lv��������� E�OPW &X  �a   *a k+ O) *j UY hO*a k+ Oa j E�O*�k+ O*a k+ Oa j E�O*�k+ Oa j a ,a ,a &E�O*a �%a  %k+ Oa !�%a "%E�O�j E�O*�k+ O*a #k+ Oa $j E�O*�k+ O*a %k+ O :a & 0*a 'a (a )0*a *,FO*a 'a +a )0a ,a -/j .O*j /UW >X  *a 0�%a 1%�%a 2%k+ O�a 3  *a 4k+ Y a 5�%_ 6%�%j O) *j /UO 7a 7a 8%_ 6%_ 6%a 9%�a :a ;lv�a <�a =�a >�a ?� E�W &X  �a   *a @k+ O) *j UY hO*a Ak+ O�a B%E�O�j E�O*�k+ Oa Ca D%a E%�a Fkv�a Ga H O*a Ik+ O) *j U ���%&� � 0 dlog  � ��'�� '  ���� .0 anyobjorlistofobjects anyObjOrListOfObjects�  % ���������������������������������� .0 anyobjorlistofobjects anyObjOrListOfObjects�� 0 lst  �� 0 i  �� 0 txt  �� 0 errmsg errMsg�� 0 orgtids orgTids�� 0 oname oName�� 
0 oid oId�� 
0 prefix  �� 0 	logtarget 	logTarget�� 0 txtcombined txtCombined�� 0 
prefixtime 
prefixTime��  0 prefixdatetime prefixDateTime�� 0 anyobj anyObj�� 0 res  �� 	0 fpath  & >������������������@����i}������������������������������������%@W����\h��m������������������� 0 dlog_targets DLOG_TARGETS
�� 
leng��  ��  
�� 
pcls
�� 
list
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
ascr
�� 
txdl
�� 
TEXT
�� 
pALL�� 0 errmsg errMsg
�� 
strq
�� .sysoexecTEXT���     TEXT
�� 
ctxt
�� 
long
�� 
doub
�� 
bool
�� 
ldt 
�� 
reco�� 
�� 
msng
�� 
pnam
�� 
ID  
�� .misccurdldt    ��� null
�� 
tstr
�� 
shdt
�� 
pcnt
�� .ascrcmnt****      � ****
�� .sysodisAaleR        TEXT� � ��,j  hY hW 	X  hO��,� 
�kvE�Y hOjvE�O]�[��l kh �E�O �klkh  P�k  >��,�  .��,�kvlvE[�k/E�Z[�l/��,FZO��%�&�%E�O���,FY ��&E�Y �a ,�&E�W "X   a �a ,%j E�W X  hO�a  Y h[OY�{Oa E�Oa a a a a �a a v��,	 �a a & �a ��,%E�Oa  E�Oa !E�O &�a ",E�O�a  �a #%�%a $%E�Y hW X  hO "�a %,E�O�a  �a &%�%E�Y hW X  hO�a '%E�O��%E�Y hO��%E�[OY��O��,a (kvlvE[�k/E�Z[�l/��,FZO��&E�Oa )*j *a +,%a ,%E�Oa -*j *a .,%a /%�[a \[Zl\Zi2%E�O���,FO ��[��l kh 	�a 0,a 1  ��%j 2Y ��a 0,a 3  ��%j 4Y u�a 0,a 5  (a 6a 7)a ",%a ,%a 8%�a ,%j E�OPY C�a 0,E�O�a 9 a :�[a \[Zm\Zi2%E�Y hOa ;��%a ,%a <%�%a =%j [OY�[ ��(����)*��
�� .aevtoappnull  �   � ****( k     ++  3,, }����  ��  ��  )  *  :������ 0 dlog_targets DLOG_TARGETS
�� .aevtoappnull  �   � ****�� �kvE�Ob   j ascr  ��ޭ