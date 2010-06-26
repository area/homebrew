require 'formula'

class Getopt <Formula
  url 'http://software.frodo.looijaard.name/getopt/files/getopt-1.1.4.tar.gz'
  homepage 'http://software.frodo.looijaard.name/getopt/'
  md5 '02188ca68da27c4175d6e9f3da732101'

  def patches
    DATA
  end

  def install
    system "make install LIBCGETOPT=0 WITHOUT_GETTEXT=1 prefix=#{prefix}"
  end
end

__END__
diff --git a/Makefile b/Makefile
index f930a28..7dbf870 100644
--- a/Makefile
+++ b/Makefile
@@ -33,7 +33,7 @@ MSGFMT=msgfmt
 LANGUAGES = cs de es fr it ja nl pt_BR
 MOFILES:=$(patsubst %,po/%.mo,$(LANGUAGES))
 
-CPPFLAGS=-DLIBCGETOPT=$(LIBCGETOPT) -DWITH_GETTEXT=$(WITH_GETTEXT) -DLOCALEDIR=\"$(localedir)\" -DNOT_UTIL_LINUX
+CPPFLAGS=-DLIBCGETOPT=$(LIBCGETOPT) -DWITHOUT_GETTEXT=$(WITHOUT_GETTEXT) -DLOCALEDIR=\"$(localedir)\" -DNOT_UTIL_LINUX
 ifeq ($(LIBCGETOPT),0)
 CPPFLAGS+=-I./gnu 
 endif
@@ -75,7 +75,7 @@ install_doc:
 	                  getopt-test.bash getopt-test.tcsh \
 	           $(DESTDIR)$(getoptdir)
 
-ifeq ($(WITH_GETTEXT),1)
+ifeq ($(WITHOUT_GETTEXT),0)
 all_po: $(MOFILES)
 install_po: all_po
 	$(INSTALL) -m 755 -d $(DESTDIR)$(localedir)

