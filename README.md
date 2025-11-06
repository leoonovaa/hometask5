# Hometask #5

**Topic:** systemd daemon configuration and autostart on AWS EC2 (Ubuntu 22.04)


Objective

* Deploy an AWS EC2 instance using **Ubuntu 22.04** (`ami-053b0d53c279acc90`).
* Create and configure a **systemd daemon** that:

  * Monitors `/root/folder1`;
  * Automatically moves any new files to `/root/folder2`;
  * Starts automatically at system boot.

Steps to Run

**Step 1 — Launch the EC2 Instance**

1. Open your AWS Management Console or use **AWS CLI**.
2. Launch a new **EC2 instance** with:

   * Image: `Ubuntu Server 22.04`
   * Instance type: `t3.micro`
   * Key pair: your existing key (`.pem` file)
   * **User data**: upload or paste your prepared setup script

Wait until the instance is in the **running** state.

 **Step 2 — Connect via SSH**

Connect to your instance from the terminal:

```bash
ssh -i "<your-key>.pem" ubuntu@<your-instance-public-ip>
```

```bash
systemctl status mover.service
```

You should see the status **active (running)**.

**Step 3 — Test Functionality**

1. Create a test file in `/root/folder1`:

   ```bash
   touch /root/folder1/testfile.txt
   ```
2. Wait 5–10 seconds and check the contents of `/root/folder2`:

   ```bash
   ls /root/folder2
   ```

The file `testfile.txt` should appear in `/root/folder2`.


Expected Result

* The daemon **starts automatically** at system boot.
* Files created in `/root/folder1` are **moved to `/root/folder2`** within a few seconds.
