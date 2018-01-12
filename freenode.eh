#!/usr/bin/env bash

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2, June 1991.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/gpl-2.0.html>,
# or in pdf format at <http://www.dhampir.no/stuff/private/gpl-2.0.pdf>

# Copyright 2016 - Øyvind 'bolt' Hvidsten   <bolt@dhampir.no>


case "${cmd^^}" in
	$ERR_NICKNAMEINUSE)
		sf_stderr "Freenode: Nickname is already in use."
		say "NickServ" "GHOST $NICK $PASS"
		return 0
	;;
	$ERR_UNAVAILRESOURCE)
		sf_stderr "Freenode: Nickname is temporarily unavailable."
		say "NickServ" "RELEASE $NICK $PASS"
		return 0
	;;
	*)
		sf_stderr "Freenode: Unknown error: ${cmd^^} ${data}"
	;;
esac

return 1
