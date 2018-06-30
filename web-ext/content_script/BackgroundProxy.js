/**
 * I am a proxy for the BackgroundFacade.
 * If you see my protocol, it matches one to one the protocol of BackgroundFacade.
 * I encapsulate message serialization and transmission. 
 */

let backgroundProxySingleton = null;

class BackgroundProxy {

    static getSingleton() {
        if (backgroundProxySingleton == null) {
            backgroundProxySingleton = new BackgroundProxy();
        }
        return backgroundProxySingleton
    }

    async submitResultsOfTask(model) {
        return await this.send({ methodName: 'submitResultsOfTask', arguments: {model: model} });
    }

    async setModelOfTask(model) {
        return await this.send({ methodName: 'setModelOfTask', arguments: {model: model} });
    }

    async activeComponetIsDone() {
        return await this.send({ methodName: 'activeComponetIsDone', arguments: {} });
    }

    async getActiveComponentSpec() {
        return await this.send({ methodName: 'getActiveComponentSpec', arguments: {} });
    }

    // Private protocol down here
    async send(rmc) {
        try {
            return browser.runtime.sendMessage(rmc);
        } catch { console.log('Background are not ready yet: ') }
    }

}