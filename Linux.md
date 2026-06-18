
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

