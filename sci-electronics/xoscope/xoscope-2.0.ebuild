# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Xoscope is a digital oscilloscope using input from a sound card"
HOMEPAGE="http://xoscope.sourceforge.net/"
SRC_URI="http://prdownloads.sourceforge.net/xoscope/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 x86 amd64"
IUSE=""

#DEPEND="gtk? ( media-libs/gtk+ )"
RDEPEND=""

src_compile() {	
   epatch "${FILESDIR}/xoscope-2.0-gtkdatabox.patch"
   econf || die
   emake || die "make failed" 
}

src_install() {
	emake install DESTDIR="${D}" || die
}

pkg_postinst() {
	elog "To report a problem goto:"
	elog " http://xoscope.sourceforge.net/"
}

