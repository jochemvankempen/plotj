This repository contains some functions used for plotting in Matlab

## Submodules
This repository contains several folders which are independent repositories, here added as [submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules)

* ../*plotj*/src/modules/[boundedline](https://github.com/kakearney/boundedline-pkg)
* ../*plotj*/src/modules/[plotboxpos](https://github.com/kakearney/plotboxpos-pkg)

After you clone this repository, fetch the code from the submodules by running 
`git submodule update --init --recursive`

## Documentation
Documentation can be found on : https://jvk.gitlab.io/plotj/

## Example
Using this code:

```Matlab
[fHandle, fSet] = plotj_initFig('width',25, 'height',15); % Initialising a figure 
subplot(1,1) % specify subplot
[axH] = plotj_initAx(fSet, 'axlabel', 1); % initialise axis with label 'a'

% then plot something nice
```

## Dependencies

## Licence
This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/.