return {
  parse(
    "plugin",
    [[
      use bevy::prelude::*;
      
      pub struct ${1}Plugin;

      impl Plugin for ${1}Plugin {
          fn build(&self, app: &mut App) {

          }
      }

      ${2}
    ]]
  ),
  parse(
    "system",
    [[
      fn ${1}_system(
          mut commands: Commands,${2}
      ) {
          ${3}
      }
    ]]
  ),
  parse(
    "component",
    [[
      #[derive(Component)]
      struct ${1} {
        ${2}
      }
    ]]
  )
}
