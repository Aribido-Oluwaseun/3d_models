function name = disp_or_write_msg_var(msg, v)
  %disp([msg inputname(2)]);
  name = num2str([msg, inputname(2)]);
end