# &mu;PM
Micro Password Manager

&mu;PM is a Free, Web-Based Password Manager!

Need a simple password manager that is freely accessible on the Web? Create a free account!
You prefer to run your own server for personal use? Checkout &mu;PM on GitHub and spin up your own instance!


## Sample DoorMat library integration

&mu;PM also serves as a DoorMat sample integration demo. The following tags illustrate the initial integration steps:
- `plain_rails_app` - this is a toy Rails application without user authentication. All passwords are visible to anybody;
- `rails_app_w_authentication` - at this stage, DoorMat is added, passwords are tied to specific actors but they are stored in plain text in the database;
- `rails_app_w_authentication_and_encryption` - encryption is added.


## Local development environment setup

For ease of deployment on Heroku, &mu;PM is setup to use the Puma webserver and Postgres database. Beyond this, nothing in the stack is Heroku specific.

To deploy &mu;PM locally, make sure you have Ruby 2.2.3 (or adjust the Gemfile accordingly), Postgres and the mailcatcher gem installed.

Create a .env file with the following entries.

```bash
LANG=en_US.UTF-8
RACK_ENV=development
RAILS_ENV=development
DOMAIN=localhost:3000
PUMA_WORKERS=1
MAX_THREADS=5
PORT=3000
SECRET_KEY_BASE= <--- generate your own key using 'bundle exec rake secret' --->
MAILER_EMAIL_ADDRESS=noreply@example.com
FORCE_SSL=FALSE
```

Finally, run `bundle install`, `RAILS_ENV=development bundle exec rake db:drop db:create`, `RAILS_ENV=development bundle exec rake db:migrate`, then bring up a web server with `foreman start` and a mail server with `mailcatcher -f`.


## License

Copyright &copy; 2016 Luc Lussier

<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/InteractiveResource" property="dct:title" rel="dct:type">&mu;PM Micro Password Manager</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="http://www.datamolecule.com/" property="cc:attributionName" rel="cc:attributionURL">Luc Lussier</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License</a>.<br />Based on a work at <a xmlns:dct="http://purl.org/dc/terms/" href="https://github.com/luclussier" rel="dct:source">https://github.com/luclussier</a>.

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
