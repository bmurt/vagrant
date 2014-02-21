# Nitro Dev Environment

Based on Vagrant and Puppet, this provides a suitable testing environment for the Nitro app.

It contains:

1. Asterisk
2. mySQL
3. Redis
4. Ejabberd
5. StatsD/Graphite and dependencies
6. (optional) Ruby/God (if you want to run Talkbox inside the VM)

## Quick instructions

1. Install [virtualbox](https://www.virtualbox.org/wiki/Downloads)
2. Install [vagrant](http://vagrantup.com)
3. Clone this repository (`git clone https://github.com/mojolingo/phrg_dev_environment.git`)
4. Update the Puppet modules: `git submodule init && git submodule update`
5. Build the VM: `vagrant up talkbox`

## Adhearsion app

1. Clone the ahn app (`git clone https://github.com/twenhold/nitro-talkbox`)
2. `bundle install`
3. `foreman start` (default .envs work with this dev VM)

### To run adhearsion inside the VM:

1. `cap devbox deploy:setup`
2. `cap devbox deploy`
3. `cap devbox deploy:start`

## Rails app

1. Clone the Rails app: `git clone https://github.com/twenhold/pws`
2. Use the `config.yml.sample` from this repo as a base for the config
3. `bundle install`
4. Start zeus: `zeus start`
5. Pull a recent database: `zeus rake dev:load_recent`
6. Massage it `zeus rake dev:massage_db`
7. Start rails `zeus s`

### To run Talkbox inside the VM:

Instead of running plain `zeus start`, run it as `RAILS_ENV=devbox zeus start`
