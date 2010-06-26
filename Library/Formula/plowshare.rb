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
  depends_on 'getopt'

  def install
    ENV["PREFIX"] = "#{prefix}"
    system "curl -o osxpatch.sh http://github.com/rybesh/plowshare/raw/master/osxpatch.sh"
    system "bash osxpatch.sh"
    system "bash setup.sh install"
  end
end
