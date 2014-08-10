# vagrant-heroku-sayoh

[betahikaru/sayoh](https://github.com/betahikaru/sayoh)をVagrantで開発するためのファイル

## Usage

- On Mac
```shell
vagrant up
vagrant ssh
```

- On Virtual Machine
```shell
/vagrant_data/bootstrap.sh
. ~/.bash_profile
heroku version
cd /vagrant_data/sayoh/
vi .env
bundle exec rspec
bundle exec rackup
```

```shell
heroku login
heroku apps:create sayoh
heroku git:remote -a sayoh
git push heroku master
```
