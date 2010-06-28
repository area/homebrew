require 'formula'

class GnuGetopt <Formula
  url 'http://software.frodo.looijaard.name/getopt/files/getopt-1.1.4.tar.gz'
  homepage 'http://software.frodo.looijaard.name/getopt/'
  md5 '02188ca68da27c4175d6e9f3da732101'

  def patches
    DATA
  end

  def install
    system "make install LIBCGETOPT=0 WITHOUT_GETTEXT=1 prefix=#{prefix} mandir=#{man} binaries=ggetopt"
  end
end
#The patch on the Makefile below does two things:
# 1. Remove WITH_GETTEXT / WITHOUT_GETTEXT confusion
# 2. Cause the built binary to be called ggetopt.

__END__
--- a/Makefile
+++ b/Makefile
@@ -17,7 +17,7 @@
 WITHOUT_GETTEXT=0
 
 # For creating the archive
-PACKAGE=getopt
+PACKAGE=ggetopt
 VERSION=1.1.4
 BASENAME=$(PACKAGE)-$(VERSION)
 UNLIKELYNAME=a8vwjfd92
@@ -33,7 +33,7 @@
 LANGUAGES = cs de es fr it ja nl pt_BR
 MOFILES:=$(patsubst %,po/%.mo,$(LANGUAGES))
 
-CPPFLAGS=-DLIBCGETOPT=$(LIBCGETOPT) -DWITH_GETTEXT=$(WITH_GETTEXT) -DLOCALEDIR=\"$(localedir)\" -DNOT_UTIL_LINUX
+CPPFLAGS=-DLIBCGETOPT=$(LIBCGETOPT) -DWITHOUT_GETTEXT=$(WITHOUT_GETTEXT) -DLOCALEDIR=\"$(localedir)\" -DNOT_UTIL_LINUX
 ifeq ($(LIBCGETOPT),0)
 CPPFLAGS+=-I./gnu 
 endif
@@ -53,7 +53,7 @@
 
 objects=$(sources:.c=.o)
 
-binaries=getopt
+binaries=ggetopt
 
 .PHONY: all clean realclean 
 all: $(binaries) all_po
@@ -61,12 +61,12 @@
 clean: clean_po
 	-$(RM) $(objects) $(binaries) 
 
-getopt: $(objects)
+ggetopt: $(objects)
 	$(CC) $(LDFLAGS) -o $@ $(objects)
 
-install: getopt install_po
+install: ggetopt install_po
 	$(INSTALL) -m 755 -d $(DESTDIR)$(bindir) $(DESTDIR)$(man1dir)
-	$(INSTALL) -m 755 getopt $(DESTDIR)$(bindir)
+	$(INSTALL) -m 755 ggetopt $(DESTDIR)$(bindir)
 	$(INSTALL) -m 644 getopt.1 $(DESTDIR)$(man1dir)
 
 install_doc:
@@ -75,7 +75,7 @@
 	                  getopt-test.bash getopt-test.tcsh \
 	           $(DESTDIR)$(getoptdir)
 
-ifeq ($(WITH_GETTEXT),1)
+ifeq ($(WITHOUT_GETTEXT),0)
 all_po: $(MOFILES)
 install_po: all_po
 	$(INSTALL) -m 755 -d $(DESTDIR)$(localedir)

