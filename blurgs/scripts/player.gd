extends CharacterBody2D
## Gusman (Player) — Blurgs MVP
## Movimentação em 8 direções com animações de idle e walk.
## Usa AnimatedSprite2D com SpriteFrames (4 direções × 2 estados).
##
## Animações esperadas no SpriteFrames:
##   idle_down, idle_up, idle_right, idle_left
##   walk_down, walk_up, walk_right, walk_left

@export var speed: float = 80.0  ## Velocidade em pixels/s

@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D

## Última direção que o jogador olhou (para idle correto)
var last_direction: String = "down"


func _physics_process(_delta: float) -> void:
	# --- Capturar input em 8 direções ---
	var input_direction := Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up", "move_down")
	)

	# Normalizar para evitar velocidade extra nas diagonais
	if input_direction.length() > 1.0:
		input_direction = input_direction.normalized()

	# Aplicar velocidade ao CharacterBody2D
	velocity = input_direction * speed

	# --- Atualizar animação ---
	if input_direction != Vector2.ZERO:
		# Está andando — determinar direção dominante
		last_direction = _get_direction_name(input_direction)
		_play_animation("walk_" + last_direction)
	else:
		# Parado — idle na última direção olhada
		_play_animation("idle_" + last_direction)

	# Mover e deslizar (colisão suave com paredes/móveis)
	move_and_slide()


func _get_direction_name(direction: Vector2) -> String:
	## Retorna "down", "up", "right" ou "left" baseado no eixo dominante.
	## Para diagonais, prioriza o eixo com maior magnitude.
	if absf(direction.x) > absf(direction.y):
		# Eixo horizontal é dominante
		return "right" if direction.x > 0 else "left"
	else:
		# Eixo vertical é dominante (ou iguais — default vertical)
		return "down" if direction.y > 0 else "up"


func _play_animation(anim_name: String) -> void:
	## Troca a animação apenas se for diferente da atual (evita restart).
	if anim_sprite and anim_sprite.animation != anim_name:
		anim_sprite.play(anim_name)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		_interact()


func _interact() -> void:
	## Placeholder para sistema de interação futuro.
	## Será expandido com RayCast2D ou Area2D para detectar objetos.
	print("Gusman tentou interagir! Direção: ", last_direction)
