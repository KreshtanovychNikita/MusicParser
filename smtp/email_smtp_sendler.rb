Pony.mail({
            :to => 'krokodile408@gmail.com.com',
            :from => 'mariagasiuk228@gmail.com',
            :subject => 'Zip',
            :body => 'SMTP Email Sendler',
            :via => :smtp,
            :via_options => {
              :address              => 'smtp.gmail.com',
              :port                 => '587',
              :enable_starttls_auto => true,
              :user_name            => 'krokodile408@gmail.com',
              :password             => '0992403922qQ',
              :authentication       => :plain,
              :return_response => true,
              # :domain               => "localhost.localdomain"
            }
          })
  