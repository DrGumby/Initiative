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
    [GtkTemplate (ui = "/com/DrGumby/Initiative/window.ui")]
    public class Window : Adw.ApplicationWindow {
        [GtkChild]
        private unowned Gtk.ListBox list_box;

        [GtkChild]
        private unowned Gtk.Button add_item;

        public Window (Gtk.Application app) {
            Object (application: app);
        }

        construct {
            var add_item_action = new SimpleAction ("add", null);
            add_item_action.activate.connect (this.add_character_dialog);
            this.add_action (add_item_action);
        }

        private AddCharacterDialog build_window() {
            AddCharacterDialog dialog = new AddCharacterDialog ();
            return dialog;
        }

        private void add_character_dialog (Variant? parameter) {
            AddCharacterDialog win = this.build_window ();
            win.present ();
            win.ok_with_data.connect ((data) => {stdout.printf("Got data %s\n", data.name);});
            win.cancel_empty.connect (() => {});
        }
    }
}
