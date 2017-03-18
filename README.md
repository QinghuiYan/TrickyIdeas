# ClassicDrosteEffect
# 2017.3.18: This is a tiny project on Droste effect. 
#            Given a picture with a hole in it, the ClassicDrosteEffect.m will output a gray png file that has the effect.
#            The transform is R=r*exp(theta), i.e. the logarithmic spiral.
#            For a detailed derivation on why it is, check Derivations.docx (written in Chinese).
#            So far I do not find a good way to output the colored figure, I used griddata (interp2 cannot make it) and imshow, but it takes too long time.
