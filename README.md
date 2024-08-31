# homelab ansible (Docker Compose) automation

- Uses mitogen for ansible to speed up runs
- Provides a `docker_container` role that templates in a `compose.yml`, applies boilerplate edits for things like autokuma labels (automatic Uptime Kuma), traefik labels (proxy), WhatsUpDocker labels (update monitoring), and Homepage labels (homedashboard)
  - This is done with a fancy set of arguments to the `docker_container` role. You can see an example in [roles/containers/bookstack/tasks/main.yml](roles/containers/bookstack/tasks/main.yml)
  - You can see the full list of permitted args via [roles/docker_container/meta/argument_specs.yml](roles/docker_container/meta/argument_specs.yml)
- Provides a `mariadb_db` role that creates a database and user. This can be included in a role's `meta/main.yml`` to add the "dependency". You can see the example in [roles/containers/bookstack/meta/main.yml](roles/containers/bookstack/meta/main.yml)
- Provides a `ansible-docker.yml` Git workflow to automatically run ansible, although I found my docker management was not reliable enough to always use this
- A convenient `sync.sh`

I originally just used Portainer stacks via the API as I was already using them and liked the UI for seeing if services were up, but I ran into many obstacles with that so I moved to Docker Compose.

I've seen given up on this and have been crafting up a simplified kubernetes
homelab, as out-of-the-box the automation is easy, declarative, and fast.
