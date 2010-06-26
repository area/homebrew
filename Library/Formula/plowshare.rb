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
  depends_on 'wget' #plowshare actually doesn't depend on this, but I use it below to get the OSX Patch

  def install
    ENV["PREFIX"] = "#{prefix}"
    system "wget http://github.com/rybesh/plowshare/raw/master/osxpatch.sh"
    system "bash osxpatch.sh"
    system "bash setup.sh install"
  end
end
