require 'Qt'

module Pomodoro
  module Component
    class MainWindow < Qt::Widget
      def initialize(parent = nil)
        super(parent)

        @menuBar = Qt::MenuBar.new
        @sessionsMenu = Qt::Menu.new(tr("Sessions"))

        @sessionsMenu.addAction(tr("History"))
        @sessionsMenu.addAction(tr("Settings"))

        @menuBar.addMenu(@sessionsMenu)
        
        @layout = Qt::VBoxLayout.new
        @layout.setContentsMargins(0, 0, 0, 0)
        
        @clockLabel = Qt::Label.new("00:00")
        @clockLabel.alignment = Qt::AlignCenter
        @clockLabel.styleSheet = """
          padding: 10px 0;
          background-color: white;
          border-top: 1px solid black;
          border-bottom: 1px solid black;
        """
 
        @actionButton = Qt::PushButton.new(tr("Start New Session"))
        @actionButton.styleSheet = """
          margin: 10px 0;
          margin-bottom: 0;
          padding: 6px;
        """

        @actionLayout = Qt::VBoxLayout.new
        @actionLayout.setContentsMargins(50, 0, 50, 0)
        @actionLayout.addWidget(@actionButton)

        @statusPomodorosLabel = Qt::Label.new(tr("0 pomodoros completed."))
        @statusBreaksLabel = Qt::Label.new(tr("0 breaks attended."))

        @statusPomodorosLabel.styleSheet = "color: green"
        @statusBreaksLabel.styleSheet = "color: red"

        @labelLayout = Qt::HBoxLayout.new
        @labelLayout.setContentsMargins(20, 10, 20, 10)

        @labelLayout.addWidget(@statusPomodorosLabel)
        @labelLayout.addWidget(@statusBreaksLabel)
        
        font = Qt::Font.new("sans serif", 24, Qt::Font::Bold)

        @clockLabel.font = font

        @layout.setMenuBar(@menuBar)
        @layout.addWidget(@clockLabel)
        @layout.addLayout(@actionLayout)
        @layout.addLayout(@labelLayout)

        @layout.setSizeConstraint(Qt::Layout::SetFixedSize)
        setLayout(@layout)
        resize(200, 100)
      end
    end
  end
end
