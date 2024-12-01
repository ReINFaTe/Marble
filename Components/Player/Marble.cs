using Godot;
using System;

public partial class Marble : RigidBody3D
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}

	public override void _Input(InputEvent @event)
	{
		if (@event is InputEventKey) {
			InputEventKey keyInput = @event as InputEventKey;
			if (keyInput.PhysicalKeycode == Godot.Key.W) {
				ApplyImpulse(Vector3.Forward);
			}
			else if (keyInput.PhysicalKeycode == Godot.Key.S) {
				ApplyImpulse(Vector3.Back);
			}
			else if (keyInput.PhysicalKeycode == Godot.Key.A) {
				ApplyImpulse(Vector3.Left);
			}
			else if (keyInput.PhysicalKeycode == Godot.Key.D) {
				ApplyImpulse(Vector3.Right);
			}
		}
	}
}
