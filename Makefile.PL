use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'		=> 'Net::YMSG',
    'VERSION_FROM'	=> 'YMSG.pm',
    'PREREQ_PM'		=> {
		'Digest::MD5' => 0.0,
	},
);
