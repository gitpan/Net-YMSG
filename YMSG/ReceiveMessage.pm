package Net::YMSG::ReceiveMessage;
use base 'Net::YMSG::Event';

sub source
{
	my $self = shift;
	if (@_) {
		$self->{source} = shift;
		my $code = $self->_get_by_name('STATUS_CODE') || 0;
		if ($code == 99) {
			require Net::YMSG::NullEvent;
			bless $self, 'Net::YMSG::NullEvent';
		}
	}
	$self->{source};
}

sub from
{
	my $self = shift;
	$self->_set_by_name('FROM', shift) if @_;
	if ($self->_get_by_name('ERROR_MESSAGE')) {
		return 'system';
	}
	$self->_get_by_name('FROM');
}


sub body
{
	my $self = shift;
	$self->_set_by_name('MESSAGE', shift) if @_;
	if ($self->_get_by_name('ERROR_MESSAGE')) {
		return $self->_get_by_name('ERROR_MESSAGE');
	}
	$self->_get_by_name('MESSAGE');
}


sub to_string
{
	my $self = shift;
	sprintf "%s: %s", $self->{sender}, $self->{body};
}

1;
__END__
