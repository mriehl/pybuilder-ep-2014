.SECONDARY:

OUTDIR = out
SOURCE = pybuilder-ep14.md
TARGET = $(OUTDIR)/index.html
REVEAL_HOME = reveal.js
CINESCRIPT_HOME = cinescript
TIMINGS=demos


$(TARGET):	*.md *.css res/* reveal.js Makefile templates/* cinescript
	rm -rf $(OUTDIR)
	mkdir -p $(OUTDIR)
	mkdir -p $(OUTDIR)/$(TIMINGS)/
	cp -r $(TIMINGS) $(OUTDIR)/
	mkdir -p $(OUTDIR)/reveal.js/
	cp -r $(REVEAL_HOME)/js $(REVEAL_HOME)/lib $(REVEAL_HOME)/css $(REVEAL_HOME)/plugin $(OUTDIR)/reveal.js/
	mkdir -p $(OUTDIR)/cinescript/
	cp -r $(CINESCRIPT_HOME) $(OUTDIR)/
	cp -r res/ fonts/ templates $(OUTDIR)
	cp *.css $(OUTDIR)
	pandoc --slide-level 1 \
		-V transition=linear -V backgroundTransition=fade \
		-i -s \
		--mathjax \
		-t revealjs -f markdown \
		--template my \
		--data-dir $(OUTDIR) \
		--css res/font-awesome.min.css \
		--css pybuilder-ep14.css \
		$(SOURCE) \
		-o $(TARGET)

reveal.js:
	git clone https://github.com/hakimel/reveal.js.git

cinescript:
	git clone https://github.com/arnehilmann/cinescript.git

deploy: $(TARGET)
	chromium-browser --allow-file-access-from-files out/index.html

clean:
	rm -rf $(OUTDIR) $(TARGET)

