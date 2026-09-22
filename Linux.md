
Listing all active processes:

```bash
ps aux
```

Listing all ports in use:

```bash
sudo ss -tulnp
```

To kill a process:

```bash
kill <PID>
```

that sends a `SIGTERM` signal, requesting the program to save data and clean up resources before shutting down. To send a `SIGKILL` signal and kill of the process completely:

```bash
kill -9 <PID>
```

Launch a GUI application in headless mode:

```sh
chromium http://localhost:5173/ > /dev/null 2>&1 & disown
```

### If you want to completely prevent suspend/hibernate

You can additionally mask the systemd sleep targets:

```bash
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
```

This is the **stronger option**: anything attempting to suspend/hibernate through systemd will fail because those targets are masked.

Check:

```bash
systemctl status sleep.target suspend.target hibernate.target
```

You should see `masked`.

To undo it:

```bash
sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target
```

You don't necessarily need to disable GNOME's power-management settings separately; the system-level systemd block is the stronger enforcement.