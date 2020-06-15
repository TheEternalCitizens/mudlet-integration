# Images

## Getting Started

> ℹ️  This readme is for people looking to contribute to this project.

## Reference

Folder `in use` is intended to store images that are currenting used in the project.
Folder `source images` contains images that were used to create the images in the `in use` folder. If an images is in the `in use` folder but not the `source images` it means there is no source image. Simply edit the image in the `in use` folder.

Currently, we don't have a way to test our code, other than manually clicking through UI. The developers of mudlet itself have been considering adopting a [GUI testing framework](https://www.froglogic.com/squish/), and maybe we should consider it too.

## Usage

When editing a source image you will want to export that image to the corrisponding folder in the `in use` folder.

Once completed the folder `imgs` in the `in use` folder needs to be converted into a .mpackage.
To do so
* open mudlet
* click `package exporter (experimental)`
* when prompted with "What do you wish to call the package:" enter `imgs` click ok
* "where do you want to save the package?" helps you select a folder to export the imgs.mpackage file to
* on the `Package Exporter` window click the bottom `Add Files` than add the folders and images in the `in use\imgs` folder to the folder that appears after clicking `Add Files`
* Click `Export` to export the imgs.mpackage to the folder you selected at the "Where do you want to save the package?" step.

## Built With

* [Mudlet](https://github.com/mudlet/mudlet) - The MUD client itself, and the editor we use when writing this code
* [CorelDraw] (https://www.coreldraw.com/) - raster and vector image editing suite.
* [inkscape] (https://inkscape.org/) - Free vector editor
* [GIMP] (https://www.gimp.org/) - Free rastor editor

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
* **Image Providers** - [Credits Page] (https://github.com/TheEternalCitizens/mudlet-integration/wiki/Credits)