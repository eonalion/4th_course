% --- Create group structure
name = {'Warren', 'Evan', 'Max', 'Nathan', 'Victoria', 'Frank', 'Aaron', 'Kate', 'Chloe'};
sname = {'Fell', 'Piters', 'Caufild', 'Prescott', 'Chase', 'Amber', 'Pole', 'Marsh', 'Price'};
lname = {'Daniel', 'Klark', 'Neil', 'Mad', 'Beverley', 'Richard', 'Alan', 'Veil', 'Eston'};
sex = {'m', 'm', 'f', 'm', 'f', 'm', 'm', 'f', 'f'};
dateOfBirth = {
    '03.12.1995', '19.10.1996', '01.02.1996', '08.09.1995', '18.11.1995', '21.07.1996', ...
    '27.05.1996', '14.06.1996', '12.12.1996'};
stature = {178, 180, 165, 174, 180, 181, 176, 164, 176};
weight = {65, 70, 49, 72, 57, 82, 78, 48, 54};
eye = {'green', 'gray', 'green', 'blue', 'brown', 'brown', 'gray', 'gray', 'gray'};
city = {
    'Arcadia Bay', 'Arcadia Bay', 'Arcadia Bay', 'Arcadia Bay', 'Arcadia Bay', ...
    'Portland', 'Arcadia Bay', 'Salem', 'Arcadia Bay'};
hostel = {'yes', 'yes', 'yes', 'yes', 'yes', 'no', 'yes', 'yes', 'no'};
mMark_1 = {9.8, 6.3, 8.2, 9.5, 9.6, 7.1, 9.2, 9.8, 6.4};
mMark_2 = {9.9, 6.7, 8.6, 8.9, 9.5, 6.8, 9.0, 9.5, 6.8};
mMark_3 = {9.6, 6.8, 8.0, 8.8, 9.6, 7.1, 9.2, 9.6, 7.0};
mMark_4 = {9.7, 7.0, 9.0, 8.9, 9.4, 7.0, 9.3, 9.4, 7.0};

group = struct('sname', sname, 'name', name, 'lname', lname, 'sex', sex, ...
    'dateOfBirth', dateOfBirth, 'stature', stature, 'weight', weight, ...
    'eye', eye, 'city', city, 'hostel', hostel, ...
    'mmark1', mMark_1, 'mmark2', mMark_2, 'mmark3', mMark_3, 'mmark4', mMark_4);

count = numel(group);

% --- Analyse date of birth
% Sort birth date values
[dates{1:count}] = deal(group.dateOfBirth);
dateVals = datetime(dates(:), 'Format', 'dd.MM.yyyy');

% Sort structure by indexes
[~, indexes]=sort(dateVals, 'descend'); 
groupSortedByDate = group(indexes); 
dateValsSorted = dateVals(indexes);

% Create plots
plots1 = figure;

subplot(2, 2, 1);
plot(dateVals, 'b-.o');
set(gca, 'xticklabel', {group.sname});
title('Subplot 1: Date of birth');
grid on;

subplot(2, 2, 2);
stem(dateVals, 'b', 'LineWidth', 6, 'MarkerSize', 1);
set(gca, 'xticklabel', {group.sname});
title('Subplot 2: Date of birth');
grid on;

subplot(2, 2, 3);
plot(dateValsSorted, 'm-.p');
set(gca, 'xticklabel', {groupSortedByDate.sname});
title('Subplot 3: Sorted date of birth');
grid on;

subplot(2, 2, 4);
title('Subplot 4: Sorted date of birth');
stem(dateValsSorted, 'm', 'LineWidth', 5, 'MarkerSize', 1);
set(gca, 'xticklabel', {sortedGroup.sname});
grid on;

saveas(plots1, 'plots_1.png');

% --- Analyse name full length
% Count full names length
names = strcat({group.sname}, {' '}, {group.name}, {' '}, {group.lname});
namesLength = cellfun(@length, names);

% Sort names and structure by indexes
[~, indexes]=sort(namesLength, 'descend'); 
groupSortedByNameLength = group(indexes); 
namesLengthSorted = namesLength(indexes);
namesSorted = names(indexes);

% Create plots
plots2 = figure;

subplot(2, 1, 1);
plot(namesLength, 'b-.o');
set(gca, 'xticklabel', names);
title('Subplot 1: Full name length');
grid on;

subplot(2, 1, 2);
plot(namesLengthSorted, 'm-.*');
set(gca, 'xticklabel', namesSorted);
title('Subplot 2: Sorted full name length');
grid on;

saveas(plots2, 'plots_2.png');