/*
 * GNU Zoomer --- Magnifying goodness
 * Copyright (C) 2023 Wasym A. Alonso
 *
 * This file is part of Zoomer.
 *
 * Zoomer is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Zoomer is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Zoomer.  If not, see <http://www.gnu.org/licenses/>.
 */


in vec3 in_pos;
in vec2 in_texcoord;
out vec2 out_texcoord;

uniform vec2 u_cam_pos;
uniform float u_cam_scale;
uniform vec2 u_win_size;
uniform vec2 u_screenshot_size;
uniform vec2 u_cursor_pos;

vec3 to_world(vec3 v) {
  vec2 ratio = vec2(u_win_size.x / u_screenshot_size.x / u_cam_scale,
		    u_win_size.y / u_screenshot_size.y / u_cam_scale);
  return vec3((v.x / u_screenshot_size.x * 2.0 - 1.0) / ratio.x,
	      (v.y / u_screenshot_size.y * 2.0 - 1.0) / ratio.y,
	      v.z);
}

void main(void) {
  gl_Position = vec4(to_world(in_pos - vec3(u_cam_pos * vec2(1.0, -1.0), 0.0)), 1.0);
  out_texcoord = in_texcoord;
}
