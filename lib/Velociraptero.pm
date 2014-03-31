package Velociraptero;
use Mojo::Base 'Mojolicious';
use Mojolicious::Plugin::RenderFile;

use strict;

# This method will run once at server start
sub startup {
	my $self = shift;

	my $config = $self->plugin('Config');
	$self->plugin('RenderFile');

	$self->helper(zotero => sub {
		$self->config->{zotero_db};
	});

	# Router
	my $r = $self->routes;
	$r->namespaces(['Velociraptero::Controller']);

	$r->get('/api/library')->to('root#collection');
	$r->get('/api/item')->to('root#items');
	$r->get('/api/item/:itemid/attachment')->to('root#item_attachments');
	$r->get('/api/item/:itemid/attachment/:itemattachmentid')->to('root#item_attachment_file');
	$r->get('/api/item/:itemid/attachment/:itemattachmentid/#name')->to('root#item_attachment_file');

	# anything else
	$r->get('/')->to('root#index');
	$r->get('/*wildcard')->to('root#wildcard');
}

1;
