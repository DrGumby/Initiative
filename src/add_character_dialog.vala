/* add_character_dialog.vala
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

    public struct CharacterData {
        public string name;
        public uint initiative;
        public int hp;
        public int max_hp;
    }

    [GtkTemplate (ui = "/com/DrGumby/Initiative/add_character_dialog.ui")]
    public class AddCharacterDialog : Adw.Window {
        public signal void ok_with_data (CharacterData data);
        public signal void cancel_empty ();

        [GtkChild]
        private unowned Gtk.Entry char_name;

        [GtkChild]
        private unowned Gtk.SpinButton char_initiative;

        [GtkChild]
        private unowned Gtk.SpinButton char_max_hp;

        [GtkChild]
        private unowned Gtk.Button char_ok;

        [GtkChild]
        private unowned Gtk.Button char_cancel;

        construct {
            this.char_ok.clicked.connect (this.on_ok);
            this.char_cancel.clicked.connect (this.on_cancel);
        }

        private void on_ok () {
            CharacterData ret = CharacterData () {
                name = this.char_name.get_text (),
                initiative = this.char_initiative.get_value_as_int (),
                hp = this.char_max_hp.get_value_as_int (),
                max_hp = this.char_max_hp.get_value_as_int (),
            };
            this.ok_with_data (ret);
            this.close ();
        }

        private void on_cancel () {
            this.cancel_empty ();
            this.close ();
        }
    }
}
