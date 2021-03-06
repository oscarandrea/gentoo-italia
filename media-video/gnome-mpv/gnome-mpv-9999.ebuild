# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 gnome2-utils meson

DESCRIPTION="A simple GTK+ frontend for mpv"
HOMEPAGE="https://github.com/gnome-mpv/gnome-mpv"
EGIT_REPO_URI="https://github.com/gnome-mpv/gnome-mpv.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""

CDEPEND=">=dev-libs/glib-2.44
	>=x11-libs/gtk+-3.20:3"
RDEPEND="${CDEPEND}
	x11-themes/gnome-icon-theme-symbolic
	>=media-video/mpv-0.21[libmpv]"
DEPEND="${CDEPEND}
	>=dev-util/meson-0.37.0
	dev-libs/appstream-glib"

pkg_preinst() {
	gnome2_icon_savelist
	gnome2_schemas_savelist
}

pkg_postrm() {
	gnome2_icon_cache_update
	gnome2_schemas_update
}
