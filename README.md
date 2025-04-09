# 📦 Getmail6 Container

Minimal container image for running [Getmail6](https://getmail6.org) — a simple and powerful mail retriever.

This container is designed to fetch emails from remote mailboxes and deliver them to a local Maildir, ready to be served by an IMAP server such as Dovecot.
Ideal for personal homelabs or private mail archive gateways.

## 🛠️ Features

- ✅ Lightweight Python 3 + Getmail6 container
- ✅ Perfect for use with Podman / Docker
- ✅ Optimized for job runners (e.g., [Ofelia](https://github.com/mcuadros/ofelia))
- ✅ Supports multi-tagging (`latest` and versioned tags)
- ✅ GitHub Actions CI/CD for automated builds

## 🚀 Usage

### Build locally

```bash
podman build -t getmail6-local .
```

### Pull from GitHub Container Registry

*(After you publish the image via GitHub Actions)*

```bash
podman pull ghcr.io/enricodeleo/getmail6:latest
```

### Run manually

```bash
podman run --rm \
  -v ./getmail:/config \
  -v /var/lib/media/mail-gateway/mail:/mail \
  getmail6-local getmail --rcfile /config/getmailrc
```

### Run via Ofelia (recommended)

Add this job to your Ofelia configuration:

```toml
[job-run "fetch-mail"]
schedule = "*/5 * * * *"
container = "getmail"
command = "getmail --rcfile /config/getmailrc"
```

## 🗂️ Configuration

Your Getmail6 configuration file should be mounted inside the container at `/config/getmailrc`.

Example `getmailrc`:

```ini
[retriever]
type = SimpleIMAPSSLRetriever
server = imap.yourprovider.com
username = your@email.com
password = yourpassword

[destination]
type = Maildir
path = /mail/

[options]
delete = true
```

## 🏷️ Tags

- `latest`: Always points to the latest tagged release.
- `vX.Y.Z`: Semantic versioning for stable, reproducible builds.

## 🧩 Integration

Use together with:
- 📨 [Dovecot container](https://hub.docker.com/_/dovecot) to serve your Maildir over IMAP.
- 🕰️ [Ofelia](https://github.com/mcuadros/ofelia) for scheduled mail fetching.
- 🖥️ Any mail client (Thunderbird, K-9, Outlook) connecting to your local Dovecot server.

## 🤖 CI/CD

This repository includes a GitHub Actions workflow to automatically build and publish the image to GitHub Container Registry (GHCR).

To create a new release:

```bash
git tag v1.0.0
git push origin v1.0.0
```

The workflow will build the image and push:
- `ghcr.io/enricodeleo/getmail6:v1.0.0`
- `ghcr.io/enricodeleo/getmail6:latest`

## 📄 License

This project is licensed under the MIT License.

---

Happy mail fetching! 🎉
