package EntryClassifiedCategories::Tags;
use strict;

sub _hdlr_entry_classified_categories {
    my ($ctx, $args, $cond) = @_;
    my $entry = $ctx->stash('entry');
    my $vars = $ctx->{__stash}{vars} ||= {};
    my $category = $entry->category();

    # 参考: https://github.com/movabletype/Documentation/wiki/Japanese-plugin-dev-2-2
    my @categories = ();

    while (1) {
        if ($category->parent() == 0) {
            push (@categories, $category);
            last;
        }

        push (@categories, $category);
        $category = MT::Category->load($category->parent());
    }

    @categories = reverse @categories;

    my $res = '';
    my $i = 0;
    my $n_categories = @categories;

    for my $category (@categories) {
        # 参考: mtdevguide1.pdf P.285
        local $ctx->{__stash}{category} = $category;
        local $vars->{__index__} = $i + 1;
        local $vars->{__first__} = ($i != 1);
        local $vars->{__last__} = ($i == $n_categories - 1);

        my $tokens = $ctx->stash('tokens');
        my $builder = $ctx->stash('builder');

        defined (my $out = $builder->build( $ctx, $tokens, $cond ));
        $res .= $out;

        $i += 1;
    }

    return $res;
}

1;