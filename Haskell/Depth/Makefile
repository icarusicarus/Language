all: Main

Tokens.hs: Tokens.x
	alex Tokens.x

Grammar.hs: Grammar.y
	happy Grammar.y

Main: Main.hs Tokens.hs Grammar.hs
	ghc --make Main

clean:
	rm -f *.o *.hi
	rm -f Grammar.hs
	rm -f Tokens.hs
	rm -f Main