# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Command line utility to split mp3 and ogg files without decoding"
HOMEPAGE="https://mp3splt.sourceforge.net"
SRC_URI="https://downloads.sourceforge.net/${PN}/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~alpha amd64 ~hppa ~ppc ~ppc64 sparc x86"
IUSE="flac"

RDEPEND=">=media-libs/libmp3splt-0.9.2-r1[flac?]"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/pkgconfig
	sys-devel/gettext
"

src_configure() {
	econf \
		--enable-oggsplt_symlink \
		$(use_enable flac flacsplt_symlink)
}

src_install() {
	default
	dodoc AUTHORS ChangeLog NEWS README TODO
}
