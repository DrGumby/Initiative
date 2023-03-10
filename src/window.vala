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
        private unowned CharacterListBox char_list_box;

        public Window (Gtk.Application app) {
            Object (application: app);
        }

        construct {
            Gtk.CssProvider css_provider = new Gtk.CssProvider ();
            string str = "row.dead { background-color: #451000; }";
            css_provider.load_from_data ((uint8[]) str);

            Gtk.StyleContext.add_provider_for_display (this.display, css_provider, 0);
        }
    }
}
