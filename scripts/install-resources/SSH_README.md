# NOTES ABOUT SSH

1. generates ssh keys
```sh
ssh-keygen
```

2. copy `id_rsa_ameize` and `id_ras_ameize.pub` into `~/.ssh`

3. optional: create a SSH config file. The following is valid for MacOS: it uses the system's keychain.

```
# `~/.ssh/config`
Host ameize*.local
  IgnoreUnknown AddKeysToAgent,UseKeychain
  UseKeychain yes
  AddKeysToAgent yes
  IdentityFile ~/.ssh/id_rsa_ameize
  User pi
```

4. otherwise, you should manually add the key to the ssh-agent

```sh
ssh-add ~/.ssh/id_rsa_ameize
```

When you change the card from one Raspberry to one other, you may get an SSH conflict. Delete entry in `~/.ssh/known_hosts`.