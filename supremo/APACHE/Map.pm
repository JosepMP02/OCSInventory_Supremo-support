package Apache::Ocsinventory::Plugins::Supremo::Map;
 
use strict;
 
use Apache::Ocsinventory::Map;

$DATA_MAP{supremo} = {
    mask => 0,
    multi => 1,
    auto => 1,
    delOnReplace => 1,
    sortBy => 'SUPID',
    writeDiff => 0,
    cache => 0,
    fields => {
        SUPID => {},
        VERSION => {}
    }
};
1;
