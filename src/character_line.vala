/* character_line.vala
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
    [GtkTemplate (ui = "/com/DrGumby/Initiative/character_line.ui")]
    public class CharacterLine : Gtk.ListBoxRow {

        public string val_name {get; set;}

        public uint val_initiative {get; set;}

        public int val_hp {get; set;}

        public int val_max_hp {get; set;}

        private unowned CharacterListBox parent_box;

        [GtkChild]
        private unowned Gtk.Label char_name;

        [GtkChild]
        private unowned Gtk.Label initiative;

        [GtkChild]
        private unowned Gtk.SpinButton hp;

        [GtkChild]
        private unowned Gtk.Label max_hp;

        [GtkChild]
        private unowned Gtk.Button delete_button;

        public CharacterLine (CharacterData data, CharacterListBox parent_box) {
            this.bind_property ("val_name", this.char_name, "label", GLib.BindingFlags.BIDIRECTIONAL | GLib.BindingFlags.SYNC_CREATE);
            this.bind_property ("val_initiative", this.initiative, "label", GLib.BindingFlags.BIDIRECTIONAL | GLib.BindingFlags.SYNC_CREATE);
            this.bind_property ("val_hp", this.hp, "value", GLib.BindingFlags.BIDIRECTIONAL | GLib.BindingFlags.SYNC_CREATE);
            this.bind_property ("val_max_hp", this.max_hp, "label", GLib.BindingFlags.BIDIRECTIONAL | GLib.BindingFlags.SYNC_CREATE);

            this.val_name = data.name;
            this.val_initiative = data.initiative;
            this.val_hp = data.hp;
            this.val_max_hp = data.max_hp;

            this.parent_box = parent_box;
            this.delete_button.clicked.connect(() => this.delete_this ());
            this.hp.value_changed.connect (this.check_zero_hp);
        }

        private void check_zero_hp () {
            string[] classes = new string[] {
                "dead",
            };

            if (this.hp.get_value_as_int () == 0) {
                this.set_css_classes(classes);
            }
            else {
                this.remove_css_class ("dead");
            }
        }

        private void delete_this () {
            this.parent_box.remove_line (this);
        }
    }
}
