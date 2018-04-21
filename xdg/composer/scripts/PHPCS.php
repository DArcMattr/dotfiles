<?php
/**
 * Contains class definition for \DArceneaux\InstallScripts
 *
 * PHP Version 7.2
 *
 * @category Utility
 * @package  DArceneaux\PHPInstallScripts
 * @author   Woody Gilk <hello@shadowhand.me>
 * @license  MIT https://opensource.org/licenses/MIT
 * @link     http://shadowhand.me/configuring-php-style-checks-with-composer/
 */
declare(strict_types=1);

namespace DArceneaux\PHPInstallScripts;

use Composer\Composer;
use Composer\IO\IOInterface as IO;
use Composer\IO\NullIO;
use Composer\Script\Event;
use Composer\Util\ProcessExecutor;
use PHP_CodeSniffer\Config;

/**
 * Class definition for \DArceneaux\PHPInstallScripts\PHPCS
 *
 * @category Utility
 * @package  DArceneaux\InstallScripts
 * @author   Woody Gilk <hello@shadowhand.me>
 * @license  MIT https://opensource.org/licenses/MIT
 * @link     http://shadowhand.me/configuring-php-style-checks-with-composer/
 */
class PHPCS
{
    /**
     * Script to run after PHP CodeSniffer is installed.
     *
     * @param \Composer\Script\Event $event Composer Event class.
     *
     * @return void
     */
    public static function postUpdate(Event $event): void
    {
        $composer = $event->getComposer();

        if (self::_isInstalled($composer, 'squizlabs/php_codesniffer')
            && self::_isInstalled($composer, 'pragmarx/laravelcs')
            && self::_isInstalled($composer, 'wp-coding-standards/wpcs')
        ) {
            self::_setPhpCsConfig($composer, $event->getIO());
        }
    }

    /**
     * Check if a Composer package is installed.
     *
     * @param \Composer\Composer $composer The main Composer class.
     * @param string             $package  The Composer package name.
     *
     * @return bool
     */
    private static function _isInstalled(Composer $composer, string $package): bool
    {
        $repository = $composer->getRepositoryManager()->getLocalRepository();
        $packages = $repository->findPackages($package);

        return 0 < count($packages) && $repository->hasPackage($packages[0]);
    }

    /**
     * Configure PHPCS settings.
     *
     * @param \Composer\Composer       $composer The main Composer class.
     * @param \Composer\IO\IOInterface $io       The Composer IOInterface class.
     *
     * @return void
     */
    private static function _setPhpCsConfig(Composer $composer, IO $io): void
    {
        $vendorDir = $composer->getConfig()->get('vendor-dir');

        $io->write('Configuring phpcs for project... ', false);

        $vendorDirs = [
          'pragmarx/laravelcs/Standards',
          'wp-coding-standards/wpcs',
        ];
        $installedPaths = ltrim(implode($vendorDirs, ",$vendorDir/"), ',');

        $executor = new ProcessExecutor(new NullIO());

        $executor->
          execute("$vendorDir/phpcs --config-set installed_paths $installedPaths");
        $executor->execute("$vendorDir/phpcs --config-set show_progress 1");

        $io->write('done.');
    }
}
