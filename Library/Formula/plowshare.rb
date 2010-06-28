require 'formula'

class Plowshare <Formula
  head 'http://plowshare.googlecode.com/svn/trunk/', :using => :svn
  homepage 'http://code.google.com/p/plowshare'


  depends_on 'recode'
  depends_on 'imagemagick'
  depends_on 'tesseract'
  depends_on 'spidermonkey'
  depends_on 'aview'
  depends_on 'coreutils'
  depends_on 'gnu-sed'
  depends_on 'gnu-getopt'
 
  def patches
    DATA
  end

  def install
    ENV["PREFIX"] = "#{prefix}"
# This is the old way of getting the old patch. This new patch is far more elegant.
#    system "curl -o osxpatch.sh http://github.com/rybesh/plowshare/raw/master/osxpatch.sh"
#    system "bash osxpatch.sh"
    system "bash setup.sh install"
  end
end
#This patch makes sure GNUtools are used on OSX. 
__END__
--- a/src/lib.sh
+++ b/src/lib.sh
@@ -1,4 +1,10 @@
 #!/bin/bash
+shopt -s expand_aliases
+alias sed='gsed'
+#gsed Needed for almost everything
+alias getopt='ggetopt'
+alias head='ghead'
+#ghead Needed for mediafire at least. Readlink not needed
 #
 # This file is part of Plowshare.
 #

