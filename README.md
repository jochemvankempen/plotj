This repository contains some functions used for plotting in Matlab

## Submodules
This repository contains several folders which are independent repositories, here added as [submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules)

* ../*plotj*/src/modules/[boundedline](https://github.com/kakearney/boundedline-pkg)
* ../*plotj*/src/modules/[export_fig](https://github.com/altmany/export_fig.git)
* ../*plotj*/src/modules/[plotboxpos](https://github.com/kakearney/plotboxpos-pkg)
* ../*plotj*/src/modules/[sigstar](https://github.com/raacampbell/sigstar.git)


After you clone this repository, fetch the code from the submodules by running 
`git submodule update --init --recursive`

## Documentation
Documentation can be found on : https://jvk.gitlab.io/plotj/

## Example
Using this code:

```Matlab

[fHandle, fSet] = plotj_initFig('width',25, 'height',15); % initialise a figure 

% create a plot
subplot(1, 2, 1) % specify subplot
[axH] = plotj_initAx(fSet, 'axlabel', 1); % initialise axis with label 'a'

x = linspace(0, 2*pi, 100); % get some x-values
y = sin(x); % get some y-values

plot(x, y, 'LineWidth', fSet.LineWidth)

title('Line plot', 'FontSize', fSet.Fontsize_title)
xlabel('x-label', 'FontSize', fSet.Fontsize_ax)
ylabel('y-label', 'FontSize', fSet.Fontsize_ax)

subplot(1, 2, 2) % specify subplot
[axH] = plotj_initAx(fSet, 'axlabel', 2); % initialise axis with label 'b'

x = randn(100, 1); % get some x-values
y = randn(100, 1); % get some y-values

plot(x, y, '.', 'MarkerSize', fSet.MarkerSize, 'Color', fSet.colors(2,:) )
h = lsline;
h.Color = fSet.colors(4,:);

title('Scatter plot', 'FontSize', fSet.Fontsize_title)
xlabel('x-label', 'FontSize', fSet.Fontsize_ax)
ylabel('y-label', 'FontSize', fSet.Fontsize_ax)
```

## Dependencies

## Licence
This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/.