# Minion

A tiny HTTP API to run commands.

Simply define commands in a *YAML*-file and you can run them by
`POST`ing `JSON` to the server.

    ---
      commands:
        - hostname: "hostname --fqdn"

Run the command:

    curl -X POST http://example.com:4567/commands/hostname

Outputs `JSON`:

    { "command": "hostname",
      "exit status": "sucess",
      "output": "example.com" }

## Attributes, Commandline options

    ---
      commands:
        - restart_app: "touch /u/apps/%app_name/current/tmp/restart.txt"

Ran with:

     curl -X POST http://example.com:4567/commands/restart_app --data 'app_name=example.com'

Outputs `JSON`:

    { "command": "touch /u/apps/example.com/current/tmp/restart.txt",
      "exit status": "sucess",
      "output": "" }

## Security

* It leverages Cocaine's security.

## Requirements

* https://github.com/thoughtbot/cocaine

## Credits

* By Savvii Wordpress Hosting
* Authors: Bèr `berkes` Kessels

## TODO

* Allow a config-option in the the YAML to fork/background commands rather then
  wait for them to finish.
* Make commands blocking: only one defined command can ever run at once.
* Introduce a `GET /commands/hostname` to stream the output if the
  command is running.
* Token based authentication.
