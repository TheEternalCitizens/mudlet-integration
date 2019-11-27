# TEC Mudlet Integration

[Mudlet](https://www.mudlet.org/) is one of the most popular MUD clients, and so we decided to build an integration for it for our favorite MUD, [The Eternal City](https://www.skotos.net/games/eternal-city/). For more on mudlet, join [their discord server](https://discord.gg/kuYvMQ9). For more on The Eternal City, see [the unofficial wiki](http://eternal-city.wikidot.com/) and join [its discord server](https://discord.gg/fevBA8j).

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project to users.

### Installing

This is step by step series of examples that tell you how to get a development environment running.

Follow the git and github steps outlined [here](./CONTRIBUTING.md#how-to-use-git-and-github).

Install [mudlet](https://www.mudlet.org/download/). Open it up, and add a new profile with `tec.skotos.net` as the host and `6730` as the port. Do not enter a character name and password.

![Screenshot from 2019-10-17 07-30-59](https://user-images.githubusercontent.com/3466499/67005268-38d67580-f0b0-11e9-9660-70ecffb995b7.png)

Click "Offline" rather than "Connect" to load the profile without connecting. Open the "Module manager", which you can find in the "Toolbox" select menu in the toolbar at the top of the screen. "Install" all the `.xml` files in this project's `src/` directory, and set them to priority 1. Install `src/imgs.mpackage` as well, and set it to priority 0.

![Screenshot from 2019-10-31 18-10-17](https://user-images.githubusercontent.com/3466499/67989620-c619de00-fc09-11e9-849f-df91d68e8c6f.png)

From this point on, you should be ready to tinker! Click "Connect" to connect to the game, and it will prompt you for your username and password. To edit some source code, open one of the files that you just installed -- for example, by clicking the "Scripts" button. Any changes you make here will be written back to your file system when you click "Save Profile". From here, you can use git to contribute your changes to this repository.

![Screenshot from 2019-10-31 18-20-21](https://user-images.githubusercontent.com/3466499/67990077-2b220380-fc0b-11e9-913d-79bee6ecc008.png)

## Running the tests

Currently, we don't have a way to test our code, other than manually clicking through UI. The developers of mudlet itself have been considering adopting a [GUI testing framework](https://www.froglogic.com/squish/), and maybe we should consider it too.

## Deployment

We use [drone.io](https://drone.io) -- a cloud-based project automation service -- to watch for activity on this github repository, and take action when it sees that we do certain things. Every time we cut [a release](https://github.com/TheEternalCitizens/mudlet-integration/releases), it uses [muddler](https://github.com/demonnic/muddler) to combine all the code in the `src` directory into an `mpackage` file, and then it uploads this file to the release page. This `mpackage` is how our users can install our code into their mudlet client.

## Built With

* [Mudlet](https://github.com/mudlet/mudlet) - The MUD client itself, and the editor we use when writing this code
* [drone.io](https://drone.io) - The service that automates turning our code into a mudlet package
* [muddler](https://github.com/demonnic/muddler) - The actual tool for turning our code into a mudlet package

## Contributing

Please read [CONTRIBUTING.md](https://github.com/TheEternalCitizens/mudlet-integration/blob/master/CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/TheEternalCitizens/mudlet-integration/tags).

## Authors

* **David Gill** - *Initial work* - [davewiththenicehat](https://github.com/davewiththenicehat)
* **Li-Hsuan Lung** - [naush](https://github.com/naush)
* **Jonathan Mohrbacher** - [johnnymo87](https://github.com/johnnymo87)

See also the list of [contributors](https://github.com/TheEternalCitizens/mudlet-integration/contributors) who participated in this project.

## License

This project is licensed under the GNU General Public License v2.0 License - see the [LICENSE.md](https://github.com/TheEternalCitizens/mudlet-integration/blob/master/LICENSE.md) file for details

## Acknowledgments

* **Vadim Peretokin** - [vadi2](https://github.com/vadi2) and the [many people that collaborate](https://github.com/Mudlet/Mudlet/contributors) with him in maintaining Mudlet
* **Damian Monogue** - [demonnic](https://github.com/demonnic) for muddler
* **Billie Thompson** - [PurpleBooth](https://github.com/PurpleBooth) for this README's [template](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2)
