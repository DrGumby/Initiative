/* window.vala
 *
 * Copyright 2023 Kamil Vojanec
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

namespace Initiative {
    [GtkTemplate (ui = "/com/DrGumby/Initiative/character_list.ui")]
    public class CharacterListBox : Gtk.Box {

        [GtkChild]
        private unowned Gtk.ListBox list_box;

        [GtkChild]
        private unowned Gtk.Button add_item;

        construct {
            this.add_item.clicked.connect (add_character_dialog);
        }

        private void add_character_dialog () {
            AddCharacterDialog win = new AddCharacterDialog ();
            win.present ();
            win.ok_with_data.connect ((data) => {stdout.printf("Got data %s\n", data.name);});
            win.cancel_empty.connect (() => {});
        }
    }
}
