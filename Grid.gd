class_name Grid
extends Resource

export var size := Vector2(20, 20)
export var cell_size := Vector2(20, 80)

var _half_cell_size = cell_size / 2

func calculate_map_position(grid_position: Vector2) -> Vector2:
	return grid_position * cell_size + _half_cell_size

func calculate_grid_coordinates(map_position: Vector2) -> Vector2:
	return (map_position / cell_size).floor()

func is_within_bounds(cell_coords: Vector2) -> bool:
	var x_in := cell_coords.x >= 0 and cell_coords.x < size.x
	var y_in := cell_coords.y >= 0 and cell_coords.y < size.y
	return x_in and y_in


func clamp(grid_position: Vector2) -> Vector2:
	var out = grid_position
	out.x = clamp(out.x, 0, size.x)
	out.y = clamp(out.y, 0, size.y)
	return out

func as_index(cell: Vector2) -> int:
	return int(cell.y * size.x + cell.x)
