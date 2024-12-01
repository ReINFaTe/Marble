using Godot;
using System;

public partial class Camera : Node3D
{

	protected float cam_v_max = 110.0f;
	protected float cam_v_min = -75.0f;
	protected float h_sensitivity = 0.1f;
	protected float v_sensitivity = 0.1f;
	protected float h_acceleration = 15f;
	protected float v_acceleration = 15f;

	private float camrot_h = 0.0f;
	private float camrot_v = 0.0f;

	private Node3D marble;
	private Node3D hRotation;
	private Node3D vRotation;
		

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		marble = GetNode<Node3D>("../Marble");
		hRotation = GetNode<Node3D>("HRotation");
		vRotation = GetNode<Node3D>("HRotation/VRotation");
		Input.MouseMode = Input.MouseModeEnum.Captured;
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _PhysicsProcess(double delta)
	{
		GlobalPosition = GlobalPosition.Lerp(marble.GetNode<MeshInstance3D>("MeshInstance3D").GlobalPosition, 0.3f);
		camrot_v = Mathf.Clamp(camrot_v, cam_v_min, cam_v_max);

		Vector3 hRotationDegrees = hRotation.RotationDegrees;
		Vector3 vRotationDegrees = vRotation.RotationDegrees;
		hRotationDegrees.Y = Mathf.Lerp(hRotation.RotationDegrees.Y, camrot_h, (float)delta * h_acceleration);
		vRotationDegrees.X = Mathf.Lerp(vRotation.RotationDegrees.X, camrot_v, (float)delta * v_acceleration);
		hRotation.RotationDegrees = hRotationDegrees;
		vRotation.RotationDegrees = vRotationDegrees;

		Vector3 rotation = RotationDegrees;
		rotation.Z = 0;
		RotationDegrees = rotation;
	}

	public override void _Input(InputEvent @event)
	{
		base._Input(@event);
		if (@event is InputEventMouseMotion) {
			camrot_h += (@event as InputEventMouseMotion).Relative.X * h_sensitivity;
			camrot_v += (@event as InputEventMouseMotion).Relative.Y * v_sensitivity;
		}
	}
}
