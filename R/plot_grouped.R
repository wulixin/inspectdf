plot_grouped <- function(df, value, series, group, plot_type, 
                         col_palette, text_labels, ylab){
  
  df[group] <- as.character(unlist(df[group]))
  df[is.na(df[group]), group] <- 'NA'
  if(plot_type == "line"){
    n_df  <- length(unlist(unique(df[series])))
    vcols <- c("gray50", user_colours(9, col_palette)[9])
    bcols <- rep(user_colours(n_df, col_palette), 2)
    plt <- df %>%
      ggplot(aes_string(x = group, y = value, colour = series, 
                        group = series)) +
      geom_blank() + theme_bw() + 
      geom_hline(yintercept = 0, alpha = 0.5, linetype = "dashed") + 
      theme(panel.border = element_blank(), 
            panel.grid.major = element_blank(), 
            axis.text.x = element_text(angle = 45)) + 
      geom_line(size = 1.5, alpha = 0.65) + 
      geom_point(size = 2) + 
      scale_colour_manual(name = "Pair", values = bcols) +
      labs(y = ylab, x = group)
  } 
  if(plot_type == "bar"){
    n_df  <- length(unlist(unique(df[group])))
    vcols <- c("gray50", user_colours(9, col_palette)[9])
    bcols <- user_colours(n_df, col_palette)
    plt <- df %>%
      ggplot(aes_string(x = series, y = value, fill = group, 
                        group = group, label = group)) +
      geom_blank() + theme_bw() + 
      theme(panel.border = element_blank(), 
            panel.grid.major = element_blank(), 
            axis.text.x = element_text(angle = 45)) +
      geom_bar(stat = "identity", position = "dodge", na.rm = T) +
      scale_fill_manual(values = bcols) +
      guides(fill = FALSE) + 
      labs(y = ylab, x = "")
    if(text_labels & !all(df[value] == 0)){
      plt <- plt + geom_bar_text(position = 'dodge',
                                 color = "white",
                                 stat = 'identity',
                                 angle = 90,
                                 grow = TRUE,
                                 reflow = TRUE,
                                 place = "top",
                                 min.size = 3, 
                                 na.rm = TRUE)
    }
  }
  return(plt)
}