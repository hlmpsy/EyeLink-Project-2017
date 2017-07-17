function content = get_event_content( event, pos_start, pos_end )
    full_content = regexpi(event,'\s+','split');
    content = full_content(pos_start:pos_end);
end