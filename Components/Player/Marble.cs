using Godot;

public partial class Marble : RigidBody3D
{

	private float movementSpeed = 385f;
	private float maxVelocity = 7.5f;

	private Camera3D camera3D;

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		camera3D = GetNode<Camera3D>("../CameraContainer/HRotation/VRotation/SpringArm3D/Camera3D");
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _PhysicsProcess(double delta)
	{
		Vector3 linearVelocity = LinearVelocity;
		if (linearVelocity.X > maxVelocity) {
			linearVelocity.X = maxVelocity;
		}
		if (linearVelocity.Z < -maxVelocity) {
			linearVelocity.Z = -maxVelocity;
		}
		if (linearVelocity.X > maxVelocity) {
			linearVelocity.X = maxVelocity;
		}
		if (linearVelocity.Z < -maxVelocity) {
			linearVelocity.Z = -maxVelocity;
		}
		LinearVelocity = linearVelocity;
		movement(delta);
	}

    private void movement(double delta)
    {
		float f_input = Input.GetActionRawStrength("backward") - Input.GetActionRawStrength("forward");
		float h_input = Input.GetActionRawStrength("right") - Input.GetActionRawStrength("left");

		Transform3D cameraTransform = camera3D.GetCameraTransform();

		Vector3 relativeCameraDirectionZ = cameraTransform.Basis.Z.Normalized();
		Vector3 relativeCameraDirectionX = cameraTransform.Basis.X.Normalized();

		Vector3 direction_f = f_input * relativeCameraDirectionZ;
		Vector3 direction_h = h_input * relativeCameraDirectionX;

		ApplyCentralForce(direction_f * movementSpeed * (float) delta);
		ApplyCentralForce(direction_h * movementSpeed * (float) delta);
    }
}
