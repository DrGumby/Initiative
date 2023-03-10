initiative_sources = [
  'main.vala',
  'application.vala',
  'window.vala',
  'add_character_dialog.vala',
  'character_list.vala'
]

initiative_deps = [
  dependency('gtk4'),
  dependency('libadwaita-1'),
]

initiative_sources += gnome.compile_resources('initiative-resources',
  'initiative.gresource.xml',
  c_name: 'initiative'
)

executable('initiative', initiative_sources,
  dependencies: initiative_deps,
       install: true,
)
