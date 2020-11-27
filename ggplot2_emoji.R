# Gráfico ggplot2 com emoji
# Auotora: Jeanne Franco
# Data 26/11/20

# Pacotes -----------------------------------------------------------------

library(emojifont) # Pacote para baixar emojis
load.emojifont("OpenSansEmoji.ttf")
library(ggplot2) # Pacote para gerar gráfico ggplot2
install.packages("styler")
library(styler) # Pacote para organizar script

# Conjunto de dados -------------------------------------------------------

nata <- c(10, 8, 7, 2)
atri <- factor(c("Pavê", "Chester", "Arroz", "Panetone"))
tab <- data.frame(nata, atri, label = c(
  emoji("cake"),
  emoji("poultry_leg"),
  emoji("rice"),
  emoji("bread")
))

# Ordenando fatores -------------------------------------------------------

levels(tab$atri)
tab$atri <- factor(tab$atri, levels = c(
  "Pavê", "Chester",
  "Arroz", "Panetone"
))
tab$atri

# Gráfico ggplot2 ---------------------------------------------------------

ggplot(data = tab, aes(
  x = atri, y = nata,
  fill = atri, label = label
)) +
  stat_summary(geom = "bar", fun = "mean") +
  scale_y_continuous(limits = c(0, 11)) +
  scale_fill_manual(values = c(
    "#377771",
    "#377771",
    "#377771",
    "#377771"
  )) +
  labs(x = "", y = "Ranking de preferência") +
  geom_text(
    family = "OpenSansEmoji",
    size = 20,
    col = "black",
    vjust = 0.05
  ) +
  theme_classic() +
  theme(
    legend.position = "none",
    text = element_text(
      size = 20,
      family = "mono",
      face = "bold.italic"
    ),
    axis.line = element_line(size = 0.8, colour = "#191919"),
    axis.title = element_text(size = 20, colour = "#191919"),
    axis.text = element_text(size = 20, colour = "#191919"),
    axis.text.x = element_text(colour = "#191919"),
    axis.text.y = element_text(colour = "#191919"),
    plot.background = element_rect(fill = "#ffaf87"),
    panel.background = element_rect(
      fill = "#ffaf87",
      colour = "#ffaf87",
      size = 0.5,
      linetype = "solid"
    ),
    panel.grid.major = element_line(
      size = 0.5, linetype = "solid",
      colour = "white"
    ),
    panel.grid.minor = element_line(
      size = 0.25, linetype = "solid",
      colour = "white"
    )
  )
